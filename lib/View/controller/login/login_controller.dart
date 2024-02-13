import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //final userController = Get.put(UserController());
  User? user;


  // @override
  // void onInit(){
  //   //email.text = localStorage.read('Remember_me_email');
  //  //password.text = localStorage.read('Remember_me_password');
  //   super.onInit();
  //
  // }

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Form Validation
      if (loginFormKey.currentState!.validate()) return;
      // TFullScreenLoader.stopLoading();


      // remember me Check
      // if (rememberMe.value) {
      //   localStorage.write('Remember_me_email', email.text.trim());
      //   localStorage.write('Remember_me_password', password.text.trim());
      // }

      // login user using Email and password authentication
      // await AuthenticationRepository.signInUsingEmailPassword( email: email.text, password: password.text);


      // redirect
      await  AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
     // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

/*  /// -- Google Sign in
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loading);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save User Record
      await userController.saveUserRecord(userCredential);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }*/
}
