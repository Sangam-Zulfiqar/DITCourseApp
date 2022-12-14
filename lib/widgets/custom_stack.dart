import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: SvgPicture.asset('images/Ellipse 1.svg'),
        ),
        Positioned(
          child: Container(
            child: SvgPicture.asset('images/Ellipse 2.svg'),
          ),
        ),
      ],
    );
  }
}
