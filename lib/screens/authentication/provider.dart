import 'package:dit_courses/screens/authentication/signup_screen.dart';
import 'package:dit_courses/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../core/core/locator/locator.dart';
import '../../core/core/services/auth_services.dart';
import '../../core/core/services/custom_auth_result.dart';
import '../../core/core/view_state.dart';
import '../../models/app_user.dart';
import '../../models/base_view_model.dart';

class AuthenticationProvider extends BaseViewModal {
  AuthenticationProvider() {
    print("AuthenticationPRovider built");
  }

  var renderScreen = 0;
  DateTime selectedDate = DateTime.now();
  var selectedDateString;
  var forgotPasswordEmail;
  var checkingText = "HEllo there";
  var emailSendingMsg;

  final _authServices = locator<AuthServices>();
  CustomAuthResult customAuthResult = CustomAuthResult();
  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();

  void changeDateFun(var d) {
    print("here is also printint" + d.toString());
    selectedDate = d;

    print("here is Selected " + selectedDate.toString());
    selectedDateString =
        DateFormat.yMMMMd("en_US").format(selectedDate).toString();
    notifyListeners();
  }

  void renderScreenFun(int getRenderScreen) {
    renderScreen = getRenderScreen;

    notifyListeners();
  }

  void checkingFun(var getText) {
    checkingText = getText;
    notifyListeners();
  }

  ///
  ///
  /// Reset Password

  resetPassword(String email) async {
    if (email != null) {
      print('Reset User password Email=>${appUser.userEmail}');
      await _authServices.resetUserPassword(email);
    } else {
      print("hellllllllooo");
    }
  }

  void updateEmailSendingMsgFun(var email) {
    emailSendingMsg = "Email has been sent to " +
        "$email" +
        "please check your spam if you have not received";
    notifyListeners();
  }

  ///
  signUpUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("User Name: ${appUser.userName}");
      print("User Email: ${appUser.userEmail}");
      print("User Password: ${appUser.password}");
      //
      appUser.isFirstLogin = true;
      setState(ViewState.busy);
      appUser.createdAt = DateTime.now();
      appUser.lastEntry = DateTime.now();

      // appUser.monthYear = monthYear.format(DateTime.now());

      ///
      customAuthResult = await _authServices.signUpUser(appUser);
      setState(ViewState.idle);
      if (customAuthResult.user != null) {
        print("SignUpUserId=> ${_authServices.appUser.appUserId}");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => ProfileScreen())));
      } else {
        print(customAuthResult.errorMessage.toString());
      }
    } else {
      print("not showing true");
    }
    //
  }

  ///

  loginUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("App user emailllllll: ${appUser.userEmail}");
      print("App user Password: ${appUser.password}");
      setState(ViewState.busy);
      customAuthResult = await _authServices.loginUser(appUser);

      setState(ViewState.idle);

      if (customAuthResult.user != null) {
        print("App user Id: ${_authServices.appUser.appUserId}");
        print("Is first Login=> ${_authServices.appUser.isFirstLogin}");
        if (_authServices.appUser.isFirstLogin == true) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => ProfileScreen())));
        } else if (_authServices.appUser.isFirstLogin == false) {
          //
        }
      } else {
        //      }
      }
    }
  }
}
