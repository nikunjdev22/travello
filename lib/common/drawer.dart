import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travello/View/Common%20WebView/common_webview.dart';

import '../View/AboutUS/about_us.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
              /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommonWebview(
                          appbarTitle: 'About Us',
                          url:
                              'https://www.itpathsolutions.com/privacy-policy/',
                        )),
              );*/
            },
          ),
          ListTileWidget(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy Policy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommonWebview(
                          appbarTitle: 'Privacy Policy',
                          url:
                              'https://www.itpathsolutions.com/privacy-policy/',
                        )),
              );
            },
          ),
          ListTileWidget(
            icon: Iconsax.book,
            text: 'Terms & Conditions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommonWebview(
                          appbarTitle: 'Terms & Conditions',
                          url:
                              'https://www.itpathsolutions.com/privacy-policy/',
                        )),
              );
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
