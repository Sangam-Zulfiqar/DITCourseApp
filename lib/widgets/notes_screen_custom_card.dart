import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';

class CustomCardForNotesScreen extends StatelessWidget {
  final String title;
  final img;
  final OnTap;
  CustomCardForNotesScreen({
    required this.title,
    required this.OnTap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: 150,
            height: 120,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        img,
                        height: 80,
                        width: 80,
                      )),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
