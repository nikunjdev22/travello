import 'package:flutter/material.dart';

import '../Constant/colors_constant.dart';

class TAuthButton extends StatelessWidget {
  const TAuthButton({
    super.key,

    this.color= AppColors.white,
    required this.text,
    this.shadowColor,
    this.buttonColor = AppColors.primary ,

  });

  final String text;
  final color;
  final shadowColor;
  final buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}