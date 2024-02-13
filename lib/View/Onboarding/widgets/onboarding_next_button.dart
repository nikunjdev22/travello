import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../controller/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: kBottomNavigationBarHeight,
        right: 24,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor:Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
