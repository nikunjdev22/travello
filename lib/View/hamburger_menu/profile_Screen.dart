
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:travello/common/animation.dart';

import '../../Utils /sizes.dart';
import '../../common/t_circular_image.dart';
import '../../common/text/section_heading.dart';
import 'Widgets/profile_menu.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                     TCircularImage(image: AppImages.user, width: 80,height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              /// Heading a profile info
              const SizedBox(height: TSizes.spaceBtwIteams/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwIteams),
              const TSectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwIteams),

              TProfileMenu(onPressed: () {  }, title: 'Name', value: 'Jon',),
              TProfileMenu(onPressed: () {  }, title: 'UserName', value: 'Jon',),

              const SizedBox(height: TSizes.spaceBtwIteams,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwIteams,),

              /// Heading a Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwIteams),

              TProfileMenu(onPressed: () {  }, title: 'User ID', value: '45689',icon: Iconsax.copy,),
              TProfileMenu(onPressed: () {  }, title: 'E-mail', value: 'Test@gmail.com'),
              TProfileMenu(onPressed: () {  }, title: 'Phone-Number', value: '9876543219'),
              TProfileMenu(onPressed: () {  }, title: 'Gender', value: 'male'),
              TProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '31 dec ,1999'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwIteams,),
              Center(
                child: TextButton(
                  onPressed: () => Get.to(() => AnimationLoginSignUp()),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

