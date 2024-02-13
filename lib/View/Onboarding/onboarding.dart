import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:travello/Constant/string_constant.dart';
import 'package:travello/View/Onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:travello/View/Onboarding/widgets/onboarding_next_button.dart';
import 'package:travello/View/Onboarding/widgets/onboarding_page.dart';
import 'package:travello/View/Onboarding/widgets/onboarding_skip.dart';
import '../controller/onboarding/onboarding_controller.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [

          /// Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  [
              OnBoardingPage(
                image: AppImages.onboarding1,
                title: AppString.onboardingTitle1,
                subTitle: AppString.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImages.onboarding2,
                title: AppString.onboardingTitle2,
                subTitle: AppString.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: AppImages.onboarding3,
                title: AppString.onboardingTitle3,
                subTitle: AppString.onboardingSubTitle3,
              )
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}




