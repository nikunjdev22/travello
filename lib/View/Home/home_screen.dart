import 'package:flutter/material.dart';

import 'package:travello/Constant/string_constant.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () => AuthController.instance.logout(),
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(AppString.welcomeHome)],
        ),
      ),
    );
  }
}
