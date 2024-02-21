import 'package:flutter/material.dart';

import '../../Constant/colors_constant.dart';
import '../../Utils /sizes.dart';

class TText extends StatelessWidget {
  TText(
      {super.key,
      required this.text,
      this.letterSpace = 1,
      this.height = 1,
      this.fontSize = TSizes.fontSizeMd,
      this.color = AppColors.white,
      this.fontWeight});

  final String text;
  final double? letterSpace;
  final double height;
  final double fontSize;
  final FontWeight? fontWeight;
  final color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight,
          letterSpacing: letterSpace),
    );
  }
}
