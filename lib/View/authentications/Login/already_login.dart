import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';

import '../../../common/authButton.dart';
import '../../../common/text/text.dart';

class LoginOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TText(text : "Existing user?"),
        SizedBox(
          height: TSizes.md,
        ),
        TAuthButton(
          text: 'LOGIN',
          shadowColor: AppColors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
