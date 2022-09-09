import 'package:dit_courses/screens/notes_screen/notes_screen.dart';
import 'package:dit_courses/widgets/custom_drawer.dart';
import 'package:dit_courses/widgets/notes_screen_custom_card.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_flat_button.dart';
import '../../widgets/custom_stack.dart';

class SemesterOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStack(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Text(
                    'First Semester Notes',
                    style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardForNotesScreen(
                        img: 'images/c-.png',
                        OnTap: () {},
                        title: 'C++',
                      ),
                      CustomCardForNotesScreen(
                        img: 'images/office.png',
                        OnTap: () {},
                        title: 'Ms Office',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardForNotesScreen(
                          img: 'images/computer-networks.png',
                          OnTap: () {},
                          title: 'Networks'),
                      CustomCardForNotesScreen(
                        img: 'images/technical-support.png',
                        OnTap: () {},
                        title: 'Introduction',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardForNotesScreen(
                        img: 'images/operative-system.png',
                        OnTap: () {},
                        title: 'Operating System',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // HomeScreeButton(
                  //   OnPress: () {
                  //     // Navigator.pop(context);
                  //   },
                  //   txt: 'Go Back',
                  // ),
                  CustomFlatButton(
                      txt: 'Selected Subject',
                      OnPress: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NotesScreen(),
                        //   ),
                        // );
                      }),
                ]),
              ),
            ]),
      ),
    );
  }
}
