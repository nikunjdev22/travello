import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travello/Utils%20/app_validation.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import '../../../Utils /authexception.dart';
import '../../../Utils /sizes.dart';
import '../../controller/auth/forget_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final c = Get.put(ForgetController());


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headline
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwIteams,
            ),
            Text(
              "Don't worry some times people forgot too , enter your email and we will send you a password reset link",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),

            /// Text Field
            Form(
              key: forgetPasswordFormKey,
              child: TextFormField(
                controller: email,
                validator: AppValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: 'email', prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// SubmitButton
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (forgetPasswordFormKey.currentState!.validate()) {
                    final _status = await controller.resetPassword(
                        email: email.text.trim());
                    if (_status == AuthStatus.successful) {
                      c.openAndCloseLoadingDialog();
                    } else {
                      final error =
                      AuthExceptionHandler.generateErrorMessage(_status);
                      Get.snackbar('user', error);
                    }
                  }
                },
                child: const Text('submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
