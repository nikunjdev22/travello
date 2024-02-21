import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/animation.dart';

class ForgetController extends GetxController{

  Future<void> openAndCloseLoadingDialog() async {
    Get.dialog(
      Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 10,
          ),
        ),
      ),
      barrierDismissible: false,
    );

    await Future.delayed(Duration(seconds: 3));
    // Dismiss CircularProgressIndicator
    Navigator.of(Get.overlayContext!).pop();

    Get.dialog(
      AlertDialog(
        title: Text("Success"),
        content: Text("'Password reset instructions have been sent to email!'"),
        actions:[
          TextButton(
            child: Text("CLOSE"),
            onPressed: () {
              Get.to(() => AnimationLoginSignUp());
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
