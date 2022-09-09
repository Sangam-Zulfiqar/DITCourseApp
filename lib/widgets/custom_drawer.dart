import 'package:dit_courses/screens/notes_screen/notes_screen.dart';
import 'package:dit_courses/screens/profile_screen/profile_screen.dart';
import 'package:dit_courses/screens/semester_subjects/1st_semester_screen.dart';
import 'package:dit_courses/screens/semester_subjects/2nd_semester_screen.dart';
import 'package:dit_courses/screens/shortcut_keys_screen/shortcut_keys_screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:provider/provider.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_provider.dart';
import '../splash_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(builder: (context, model, child) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: PrimaryColor),
                accountName: Text(
                  model.appUser.userName == null
                      ? 'Name'
                      : model.appUser.userName.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  model.appUser.userEmail == null
                      ? 'Email'
                      : model.appUser.userEmail.toString(),
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 80,
                  backgroundImage: model.appUser.profileImage != null
                      ? NetworkImage("${model.appUser.profileImage}")
                      : AssetImage('assets/prof.png') as ImageProvider,
                  child: Text(''),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: PrimaryColor,
                ),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                  leading: Icon(
                    Icons.menu_book_sharp,
                    color: PrimaryColor,
                  ),
                  title: Text('Semester 1'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterOneScreen(),
                        ));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.menu_book_sharp,
                    color: PrimaryColor,
                  ),
                  title: Text('Semester 2 '),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterTwoScreen(),
                        ));
                  }),
              ListTile(
                leading: Icon(
                  Icons.notes,
                  color: PrimaryColor,
                ),
                title: Text('Notes Screen'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => NotesScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.keyboard_sharp,
                  color: PrimaryColor,
                ),
                title: Text('ShortCut Keys'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShortCutKeysScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: PrimaryColor,
                ),
                title: const Text('Log Out'),
                onTap: () async {
                  await model.locateUser.logoutUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
              // AboutListTile(
              //   icon: Icon(
              //     Icons.info,
              //     color: PrimaryColor,
              //   ),
              //   child: Text('About app'),
              //   applicationIcon: Icon(
              //     Icons.local_play,
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
