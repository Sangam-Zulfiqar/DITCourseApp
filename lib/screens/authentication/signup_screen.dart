import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/models/app_user.dart';
import 'package:dit_courses/screens/authentication/log_in_screen.dart';
import 'package:dit_courses/screens/authentication/provider.dart';
import 'package:dit_courses/screens/home_screen/home_screen.dart';
import 'package:dit_courses/widgets/custom_flat_button.dart';
import 'package:dit_courses/widgets/custom_stack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_textfeild.dart';
import '../profile_screen/profile_screen.dart';

class SignUpScreen extends StatelessWidget {
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
                      height: 10,
                    ),
                    Text(
                      "Lets Get Started",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create Account To Access The Study Material",
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
                          return "Name can't be empty";
                        }
                      },
                      onChanged: (value) {
                        model.appUser.userName = value;
                      },
                      hinttext: 'User Name',
                      prefixIcon: Icon(
                        Icons.person_add_outlined,
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      keyBoardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        model.appUser.userEmail = value;
                      },
                      hinttext: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        model.appUser.password = value;
                      },
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return "password must not be less than 6 character";
                        }
                      },
                      hinttext: 'Pasword',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      prefixIcon: Icon(
                        Icons.wrap_text_outlined,
                        color: PrimaryColor,
                      ),
                      maxLine: 5,
                      //   controller: model.descriptonController,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        model.appUser.description = value;
                      },
                      hinttext: 'Description',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Do Already have an account?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' LogIn',
                                    style: TextStyle(
                                        color: PrimaryColor, fontSize: 18),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LogIn(),
                                            ));
                                      })
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFlatButton(
                        txt: 'SignUp',
                        OnPress: () {
                          model.signUpUser(model.appUser, context);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ProfileScreen(),
                          //     ));
                        })
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
