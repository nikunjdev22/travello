import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import 'package:travello/View/controller/auth/auth_controller.dart';
import 'package:travello/View/controller/home/home_controller.dart';
import 'package:travello/common/text.dart';
import '../details/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () => AuthController.instance.logout(),
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: Obx(() => homeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: homeController.productData?.products?.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(TSizes.md),
                    elevation: TSizes.md,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          homeController.productData!.products![index].thumbnail
                              .toString(),
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.all(TSizes.buttonHeight),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TText(
                                  text: homeController
                                      .productData!.products![index].title
                                      .toString(),
                                  fontSize: TSizes.fontSizeXl,
                                  color: Colors.grey[800]),
                              SizedBox(height: TSizes.sm),
                              TText(
                                  text: homeController
                                      .productData!.products![index].description
                                      .toString(),
                                  fontSize: TSizes.fontSizeMd,
                                  color: Colors.grey[700]),
                              Row(
                                children: [
                                  const Spacer(),
                                  TextButton(
                                    child: const Text(
                                      "SHARE",
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: const Text(
                                      "EXPLORE",
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                    onPressed: () => Get.to(() => DetailsScreen(
                                          image: homeController.productData!
                                              .products![index].thumbnail
                                              .toString(),
                                          title: homeController.productData!
                                              .products![index].title
                                              .toString(),
                                          description: homeController
                                              .productData!
                                              .products![index]
                                              .description
                                              .toString(),
                                          additionalItems: homeController
                                              .productData!
                                              .products![index]
                                              .images!
                                              .map((image) => image.toString())
                                              .toList(),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )));
  }
}
