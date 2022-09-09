import 'package:dit_courses/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Card2 extends StatelessWidget {
  final img;
  final ontap;
  final String title;
  Card2({
    required this.title,
    required this.ontap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Image.asset(
                img,
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
