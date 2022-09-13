import 'dart:async';
import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/screens/authentication/log_in_screen.dart';
import 'package:dit_courses/screens/authentication/signup_screen.dart';
import 'package:dit_courses/screens/profile_screen/profile_screen.dart';
import 'package:dit_courses/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'core/core/locator/locator.dart';
import 'core/core/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenDelay();
  }

  splashScreenDelay() async {
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));

    if (_authService.appUser.appUserId != null && _authService.isLogin!) {
      if (_authService.appUser.isFirstLogin ?? false) {
        Get.offAll(
          () => WelcomeScreen(),
        );
      } else {
        Get.offAll(() => WelcomeScreen());
        print('User id=> ${_authService.appUser.appUserId}');
        Future.delayed(Duration(seconds: 1));
        // Get.snackbar("Congrats", "message",snackStyle: SnackStyle.FLOATING,isDismissible: true);
      }
    } else if (_authService.appUser == null && !_authService.isLogin!) {
      Get.offAll(() => LogIn());
      print("App user name ${_authService.appUser.userName}");
      print("isLogin ${_authService.isLogin}");
    } else {
      Get.offAll(() => WelcomeScreen());
      print("User email ${_authService.appUser.userEmail}");
      print("isLogin ${_authService.isLogin}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset('images/animatedLogo.svg'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Course App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: PrimaryColor),
            )
          ],
        ),
        //   child: Text(
        //     "Splash Screen",
        //     style: TextStyle(
        //         color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        //   ),
        // ),
      ),
    );
  }
}
