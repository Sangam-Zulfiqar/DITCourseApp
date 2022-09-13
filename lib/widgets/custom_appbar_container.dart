import 'package:dit_courses/constants/colors.dart';
import 'package:flutter/material.dart';

import 'custom_stack.dart';

class CustomAppBarContainer extends StatelessWidget {
  const CustomAppBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomStack(),
            Builder(
                builder: (context) => IconButton(
                      //   //menu icon button at start left of appbar
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                        //code to execute when this button is pressed
                      },
                      icon: Icon(
                        Icons.menu,
                        color: PrimaryColor,
                        size: 35,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
