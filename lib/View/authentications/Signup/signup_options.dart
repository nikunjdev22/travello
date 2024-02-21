import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/common/text/text.dart';
import '../../../common/authButton.dart';

class SignUpOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: TText(text: 'OR', fontSize: 24, color: AppColors.primary)),
        SizedBox(
          height: TSizes.lg,
        ),
        TAuthButton(
          text: "SIGN UP",
          color: AppColors.primary,
          buttonColor: AppColors.white,
          shadowColor: AppColors.primary.withOpacity(0.2),
        ),
      ],
    );
  }
}
