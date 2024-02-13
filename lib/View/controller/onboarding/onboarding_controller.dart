import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travello/View/Home/home_screen.dart';

import '../../../common/animation.dart';
import '../../authentications/Login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to Specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage= GetStorage();
     storage.write('isFirstTime', false);
      Get.offAll( AnimationLoginSignUp());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update current index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpTo(2);
  }
}
