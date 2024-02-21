import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: AppColors.white,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: CircularProgressIndicator(color: Colors.blue),
          ),
        )
    );
  }
}
