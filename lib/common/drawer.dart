import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../View/hamburger_menu/profile_Screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 50),
          ListTileWidget(
            icon: Icons.home,
            text: 'About Us',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTileWidget(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy Policy',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTileWidget(
            icon: Iconsax.book,
            text: 'Terms & Conditions',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTileWidget(
            icon: Icons.person,
            text: 'User Profile',
            onTap: () {
              Navigator.pop(context);
              Future.delayed(Duration(milliseconds: 50), () {
                Get.to(() => ProfileScreen());
              });
            },
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
  }
}
