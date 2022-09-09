import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/screens/authentication/signup_screen.dart';
import 'package:dit_courses/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_flat_button.dart';
import '../../widgets/custom_stack.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStack(),
          Padding(
            padding: EdgeInsets.only(left: 130.0),
            child: Column(
              children: [
                Container(
                  child: SvgPicture.asset('images/animatedLogo.svg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Welcome To Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit.Interdum dictum tempus, interdum at dignissim\nmetus. Ultricies sed nunc.',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 16, height: 1.2),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomFlatButton(
            OnPress: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            txt: 'Get Started',
          ),
        ],
      ),
    );
  }
}
