import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dit_courses/core/core/services/auth_services.dart';
import 'package:dit_courses/models/post_model.dart';

import 'package:intl/intl.dart';
import '../../../models/app_user.dart';
import '../../../models/request_model.dart';

import '../locator/locator.dart';

class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;

  //final currentAppUser = locator<AuthServices>();

  ///
  /// Add user
  ///
  registerUser(AppUser appUser) {
    try {
      firebaseFireStore
          .collection("AppUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception $e');
    }
  }

  ///
  /// Get user
  ///
  Future<AppUser> getUser(id) async {
    print('GetUser id: $id');
    try {
      final snapshot =
          await firebaseFireStore.collection('AppUser').doc(id).get();
      // print('Current app User Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
      return AppUser();
    }
  }

  ///
  /// get all app users
  ///
  Future<List<AppUser>> getAppUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('AppUser')
          .where('appUserId',
              isNotEqualTo: locator<AuthServices>().appUser.appUserId)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }

  Future<List<AppUser>> getWholeUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('AppUser')
          .orderBy('faceCardNumber', descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }

  ///
  /// get all app users
  ///
  Future<List<AppUser>> getTopThreeUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore
          .collection('AppUser')
          .orderBy('faceCardNumber', descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }

  updateUserProfile(AppUser appUser) async {
    try {
      await firebaseFireStore
          .collection('AppUser')
          .doc(appUser.appUserId)
          .update(appUser.toJson());
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }

  updateotherUserProfile(double zaps, String userId) async {
    try {
      await firebaseFireStore
          .collection('AppUser')
          .doc(userId.toString())
          .update({
        'faceCardNumber': zaps,
      });
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }

  setPostDataInFirebase(PostModel postModel, String UserImage) async {
    try {
      await firebaseFireStore
          .collection('Post')
          // .doc(postModel.UserId.toString())
          .doc(UserImage)
          .set(postModel.toJson());
    } catch (e) {
      print("Exception@UpdateUserProfile=>$e");
    }
  }

  sendZapsRequest(ZapRequestModel zapRequestModel, String recieverId) async {
    try {
      await firebaseFireStore
          .collection('ZapRequests')
          .doc(recieverId)
          .collection("setRequest")
          .doc()
          .set(zapRequestModel.toJson());
    } catch (e) {
      print('Exception@Zaps requests=>$e');
    }
  }
}
