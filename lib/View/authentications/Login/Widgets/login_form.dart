import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Constant/string_constant.dart';
import 'package:travello/Utils%20/app_validation.dart';
import 'package:travello/View/Home/home_screen.dart';
import '../../../../Utils /sizes.dart';
import '../../../controller/login/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => AppValidator.validateEmail(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: AppString.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),

              /// Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => AppValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: AppString.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField / 2,
              ),

              /// Remember Me and Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember Me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value =
                                !controller.rememberMe.value),
                      ),
                      Text(AppString.rememberMe)
                    ],
                  ),

                  /// Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => const HomeScreen()),
                      child: Text(AppString.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sign In Button
              /* SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: Text(AppString.signIn, ))),*/
              new Container(
                width: double.infinity,
                height: 40.0,
                alignment: FractionalOffset.center,
                decoration: new BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(30.0)),
                ),
                child: new Text(
                  "Sign In",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwIteams,
              ),

              /// Create Account Button
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'New Member? ',
                    ),
                    TextSpan(
                      text: 'Register Now',
                      style: TextStyle(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const HomeScreen()),
                    )
                  ],
                ),
              )
              /*       SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const HomeScreen()),
                      child:  Text(AppString.createAccount))),*/
            ],
          ),
        ));
  }
}
