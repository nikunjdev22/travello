import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
              color: AppColors.black,
              thickness: 0.5,
              indent: 60,
              endIndent: 5,
            )),
        Text(
          dividerText,
        ),
        Flexible(
            child: Divider(
              color: AppColors.black,
              thickness: 0.5,
              indent: 5,
              endIndent: 60,
            ))
      ],
    );
  }
}
