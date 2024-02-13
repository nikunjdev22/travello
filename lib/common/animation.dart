import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/View/authentications/Login/login.dart';
import '../View/authentications/Login/already_login.dart';
import '../View/authentications/Signup/signup.dart';
import '../View/authentications/Signup/signup_options.dart';
import 'curve_design.dart';

class AnimationLoginSignUp extends StatefulWidget {
  @override
  _AnimationLoginSignUpState createState() => _AnimationLoginSignUpState();
}

class _AnimationLoginSignUpState extends State<AnimationLoginSignUp> {

  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            GestureDetector(
              onTap: () {
                setState(() {
                  login = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.4,
                child: CustomPaint(
                  painter: CurvePainter(login),
                  child: Container(
                    padding: EdgeInsets.only(bottom: login ? 0 : 55),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: TSizes.xl, vertical: TSizes.md),
                          child: login
                              ? LoginScreen()
                              : LoginOption(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  login = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.6,
                child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(top: login ? 55 : 0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: TSizes.xl, vertical: TSizes.md),
                          child: !login
                              ? SignUp()
                              : SignUpOption(),
                        ),
                      ),
                    )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
