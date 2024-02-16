import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travello/View/Onboarding/onboarding.dart';
import '../../../common/animation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../Home/home_screen.dart';


class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final signOut = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  /// called from main.dart on app launch
  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, screenRedirect);

  }

  screenRedirect(User? user) async {
    if (user != null) {
      Get.offAll(() => const HomeScreen());
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() =>  AnimationLoginSignUp())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  void login(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void register(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      Get.snackbar("About User", " User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Account Already exists',
              style: TextStyle(color: Colors.white)),
          messageText: Text(e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  Future<void> logout() async {
      await  _auth.signOut();
  }
}
