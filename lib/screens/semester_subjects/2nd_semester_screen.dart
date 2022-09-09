import 'package:dit_courses/widgets/custom_drawer.dart';
import 'package:dit_courses/widgets/notes_screen_custom_card.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_flat_button.dart';
import '../../widgets/custom_stack.dart';
import '1st_semester_screen.dart';

class SemesterTwoScreen extends StatelessWidget {
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
                    'Second Semester Notes',
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
                        img: 'images/database.png',
                        OnTap: () {},
                        title: 'DataBase',
                      ),
                      CustomCardForNotesScreen(
                        img: 'images/acc.png',
                        OnTap: () {},
                        title: 'Ms Access',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardForNotesScreen(
                        img: 'images/programming.png',
                        title: 'Ecom And Web',
                        OnTap: () {},
                      ),
                      CustomCardForNotesScreen(
                        img: 'images/GD1.png',
                        OnTap: () {},
                        title: 'Graphic Designing',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardForNotesScreen(
                        img: 'images/project.png',
                        OnTap: () {},
                        title: 'Projects',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFlatButton(txt: 'Done', OnPress: () {}),
                ]),
              ),
            ]),
      ),
    );
  }
}
