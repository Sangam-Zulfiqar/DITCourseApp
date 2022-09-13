import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/screens/authentication/provider.dart';
import 'package:dit_courses/screens/authentication/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_flat_button.dart';
import '../../widgets/custom_stack.dart';
import '../../widgets/custom_textfeild.dart';

import '../profile_screen/profile_screen.dart';

class LogIn extends StatelessWidget {
  //bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child:
            Consumer<AuthenticationProvider>(builder: (context, model, child) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Form(
              key: model.formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        CustomStack(),
                      ],
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset('images/animatedLogo.svg'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "LogIn Into Your Existing Account For Access",
                    style: TextStyle(
                        fontSize: 14,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                    },
                    onChanged: (value) {
                      model.appUser.userEmail = value;
                    },
                    hinttext: 'User Email',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: Icon(
                      Icons.mail_outlined,
                      color: PrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                    },
                    onChanged: (value) {
                      model.appUser.password = value;
                    },
                    hinttext: 'Password',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    prefixIcon: IconButton(
                      onPressed: () {
                        // isHiddenPassword = !isHiddenPassword;
                      },
                      icon: Icon(
                        isHiddenPassword
                            ? Icons.remove_red_eye
                            : Icons.no_encryption_rounded,
                        color: PrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          //    model.resetPassword;
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                      color: PrimaryColor, fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
                                        ),
                                      );
                                    })
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFlatButton(
                      txt: 'LogIn',
                      OnPress: () {
                        model.loginUser(model.appUser, context);
                      })
                ],
              ),
            ),
          ));
        }));
  }
}
