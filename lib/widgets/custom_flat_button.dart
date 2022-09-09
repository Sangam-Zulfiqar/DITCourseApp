import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomFlatButton extends StatelessWidget {
  final String txt;
  final OnPress;
  CustomFlatButton({
    required this.txt,
    required this.OnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: PrimaryColor,
        ),
        width: 300,
        child: FlatButton(
          onPressed: OnPress,
          child: Text(
            txt,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
