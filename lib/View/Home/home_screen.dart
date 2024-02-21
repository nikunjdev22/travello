import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/View/Home/widget/home_list_view.dart';
import 'package:travello/View/controller/home/home_controller.dart';
import 'package:travello/common/text/text.dart';
import '../../Constant/image_constant.dart';
import '../../common/drawer.dart';
import '../../common/search_container.dart';
import '../../common/t_circular_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Center(child: Text("Home Screen")),
            actions: [
              TCircularImage(image: AppImages.user, width: 50,height: 50),
            ],
           bottom: PreferredSize(
              preferredSize: Size.fromHeight(120.0), // Adjust the height as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: TText(
                      text :"Welcome Travello",
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 5,bottom: 10),
                    child: TText(
                      text :"Let's Explore Places : ",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const TabBar(
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Popular'),
                      Tab(text: 'Nearby'),
                      Tab(text: 'Recommended'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          drawer: DrawerWidget() ,

          body: Column(
            children: [
              SizedBox(height: TSizes.defaultSpace,),
              TSearchContainer(
                text: "Search", // Adjust the placeholder text
              ),
              Expanded(
                child: Obx(() => homeController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TabBarView(
                      children: [
                        ListViewPage(),
                        Text('gcu'),
                        Text('gcu'),
                        Text('gcu'),
                    ])),
              ),
            ],
          )),
    );
  }


}

