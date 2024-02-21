import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:travello/View/details/details_screen.dart';

import '../../../Constant/colors_constant.dart';
import '../../../Utils /sizes.dart';
import '../../../common/text/text.dart';
import '../../controller/home/home_controller.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return ListView.builder(
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
                  homeController.productData?.products![index].thumbnail
                          .toString() ?? AppImages.carousalSlider2,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(TSizes.buttonHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TText(
                        text: homeController.productData?.products![index].title
                                .toString() ??
                            'Places',
                        fontSize: TSizes.fontSizeXl,
                        color: Colors.grey[800],
                      ),
                      SizedBox(height: TSizes.sm),
                      TText(
                        text: homeController
                                .productData?.products![index].description
                                .toString() ??
                            'More places Explore',
                        fontSize: TSizes.fontSizeMd,
                        color: Colors.grey[700],
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: const Text(
                              "SHARE",
                              style: TextStyle(color: AppColors.primary),
                            ),
                            onPressed: () {},
                          ),
                          const Spacer(),
                          TextButton(
                            child: const Text(
                              "SHARE",
                              style: TextStyle(color: AppColors.primary),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: const Text(
                              "EXPLORE",
                              style: TextStyle(color: AppColors.primary),
                            ),
                            onPressed: () => Get.to(() => PlaceDetails(
                                  url: homeController
                                      .productData!.products![index].thumbnail
                                      .toString(),
                                  title: homeController
                                      .productData!.products![index].title
                                      .toString(),
                                  description: homeController
                                      .productData!.products![index].description
                                      .toString(),
                                  additionalItems: homeController
                                      .productData!.products![index].images!
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
        });
  }
}
