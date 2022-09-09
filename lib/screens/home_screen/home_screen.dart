import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../authentication/log_in_screen.dart';
import '../authentication/provider.dart';
import '../authentication/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Column(
            children: [
              CustomStack(),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: SvgPicture.asset('images/animatedLogo.svg'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Material(
              elevation: 5,
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(30),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),
                  );
                },
                minWidth: 420,
                height: 42,
                child: Text(
                  "Log-In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                minWidth: 420,
                height: 42,
                child: Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ]));
  }
}
