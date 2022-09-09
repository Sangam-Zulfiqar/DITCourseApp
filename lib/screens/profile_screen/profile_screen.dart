import 'package:dit_courses/screens/profile_screen/clock.dart';

import 'package:flutter/foundation.dart';
import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/screens/notes_screen/notes_screen.dart';
import 'package:dit_courses/widgets/custom_flat_button.dart';
import 'package:dit_courses/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_drawer.dart';
import 'checkbox_provider.dart';
import 'profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(builder: (context, model, child) {
        return ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
          child: Scaffold(
            endDrawer: CustomDrawer(),
            body: Consumer<CheckBoxProvider>(
                builder: (context, Checkboxmodel, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: PrimaryColor,
                          height: 300,
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 80.0),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: model.userImage != null
                                            ? FileImage(model.userImage!)
                                            : AssetImage('assets/prof.png')
                                                as ImageProvider,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: PrimaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.only(),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          model.pickImageFromGallery();
                                        },
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                model.appUser.userName == null
                                    ? 'Name Here'
                                    : model.appUser.userName.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                model.appUser.description == null
                                    ? 'Discription Here'
                                    : model.appUser.description.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomStack(),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Good AfterNoon',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            child: Clock(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Subject List',
                              style: TextStyle(
                                  color: PrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 280,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subjects List',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.add_circle_outline_rounded,
                                            color: PrimaryColor,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: Checkboxmodel.isValueOS,
                                            onChanged: (value) {
                                              Checkboxmodel.isCheckedOS =
                                                  value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Operating System',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                Checkboxmodel.isValueMsOffice,
                                            onChanged: (value) {
                                              Checkboxmodel.isCheckedMsOffice =
                                                  value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Ms Office ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                Checkboxmodel.isValueMsAccess,
                                            onChanged: (value) {
                                              Checkboxmodel.isCheckedMsAccess =
                                                  value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Ms Access',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: Checkboxmodel.isValueIT,
                                            onChanged: (value) {
                                              Checkboxmodel.isCheckedIT =
                                                  value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Introdcution To IT',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                Checkboxmodel.isValueEcomAndWeb,
                                            onChanged: (value) {
                                              Checkboxmodel
                                                      .isCheckedEcomAndWeb =
                                                  value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Ecommerce And Webdevelopment',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: Checkboxmodel.isValue,
                                            onChanged: (value) {
                                              Checkboxmodel.isChecked = value!;
                                              // model.isChecked = value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Computer And Networks',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: Checkboxmodel
                                                .isValueProgramming,
                                            onChanged: (value) {
                                              Checkboxmodel
                                                      .isCheckedProgramming =
                                                  value!;
                                              // model.isChecked = value ?? true;
                                            },
                                          ),
                                          Text(
                                            'Programming',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomFlatButton(
                            txt: 'Go To Notes Screen',
                            OnPress: () {
                              model.updateProfile();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotesScreen(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}


/// time greetimg conditions
/// String greeting = ""; 
//     int hours=now.hour;


//     if(hours>=1 && hours<=12){ 
//     greeting = "Good Morning"; 
//     } else if(hours>=12 && hours<=16){
//      greeting = "Good Afternoon"; 
//     } else if(hours>=16 && hours<=21){ 
//     greeting = "Good Evening";
//      } else if(hours>=21 && hours<=24){ 
//     greeting = "Good Night"; 
//     }

// Print("your message:-"+greeting);