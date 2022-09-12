import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/widgets/card2.dart';
import 'package:dit_courses/widgets/custom_flat_button.dart';
import 'package:dit_courses/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../splash_screen.dart';
import '../../widgets/custom_drawer.dart';
import '../profile_screen/profile_provider.dart';

class ShortCutKeysScreen extends StatelessWidget {
  const ShortCutKeysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
        child: Consumer<ProfileProvider>(builder: (context, model, child) {
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
                          'ShortCut Keys',
                          style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card2(
                          img: "images/word.png",
                          ontap: () {},
                          title: 'Ms Word',
                        ),
                        Card2(
                          img: "images/excel.png",
                          ontap: () {},
                          title: 'Ms Excel',
                        ),
                        Card2(
                          img: "images/power-point.png",
                          ontap: () {},
                          title: 'PowerPoint',
                        ),
                        Card2(
                          img: "images/acc.png",
                          ontap: () {},
                          title: 'Ms Access',
                        ),
                        Card2(
                          ontap: () {},
                          img: "images/corel.png",
                          title: 'CorelDraw',
                        ),
                        Card2(
                          ontap: () {},
                          img: "images/inpage.png",
                          title: 'InPage',
                        ),
                        Card2(
                          ontap: () {},
                          img: "images/psd.png",
                          title: 'PhotShop',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFlatButton(txt: 'Done', OnPress: () {}),
                        // CustomFlatButton(
                        //     txt: 'Log Out',
                        //     OnPress: () async {
                        //       //  var model;
                        //       await model.locateUser.logoutUser();
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => SplashScreen()));
                        //     }),
                      ]),
                    ),
                  ]),
            ),
          );
        }));
  }
}
