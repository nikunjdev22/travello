import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travello/View/Onboarding/onboarding.dart';
import '../../../Utils /auth_exception.dart';
import '../../../common/animation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../common/carousel_slider.dart';
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
  static late AuthStatus _status;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isLoading = false;

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
      Get.offAll(() =>  CarousalScreen());
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => AnimationLoginSignUp())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  void login(String email, password) async {
    try {
      isLoading = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading = false;
      //return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void register(String email, password) async {
    try {
      isLoading = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
        isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;
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
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
