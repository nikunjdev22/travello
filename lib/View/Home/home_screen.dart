import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_animate_tab/scroll_to_animate_tab.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/View/Home/widget/home_list_view.dart';
import 'package:travello/View/Home/widget/horizontal_list_view.dart';
import 'package:travello/View/controller/home/home_controller.dart';
import 'package:travello/common/text/text.dart';
import '../../Constant/image_constant.dart';
import '../../common/drawer.dart';
import '../hamburger_menu/Widgets/t_circular_image.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<String> images= [
    AppImages.carousalSlider1,
    AppImages.carousalSlider2,
    AppImages.carousalSlider3,
  ];
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home Screen")),
          actions: [
            TCircularImage(image: AppImages.user, width: 50, height: 50),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // Adjust the height as needed
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: TText(
                      text: "Welcome Travello",
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                    child: TText(
                      text: "Let's Explore Places ",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(),
        body: ScrollToAnimateTab(
          activeTabDecoration: TabDecoration(
            textStyle: const TextStyle(color: AppColors.primary),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black, // Your desired color
                  width: 2.0, // Your desired width
                ),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          tabs: [
            ScrollableList(
              label: "All",
              body: Obx(() => homeController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : HorizontalListView()),
            ),
            ScrollableList(
              label: "Popular",
              body: Obx(
                () => homeController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListViewPage(),
              ),
            ),
            ScrollableList(
              label: "Recommended",
              body: Container(
                height: 300, // Set the desired height
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: GestureDetector(
                        onTap: () {
                          print('Image tapped: ${images[index]}');
                        },
                        child: Container(
                          width: 150,
                          height: 200,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
