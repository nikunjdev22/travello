import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/colors_constant.dart';
import '../../../Constant/image_constant.dart';
import '../../../Utils /sizes.dart';
import '../../../common/text/text.dart';
import '../../controller/home/home_controller.dart';
import '../../details/details_screen.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return SizedBox(
      height: 270,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
          homeController.productData?.products?.length ??
              0,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.white,
              margin: EdgeInsets.all(TSizes.md),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    TSizes.cardRadiusLg),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector(
                onTap: () => Get.to(() => PlaceDetails(
                  title: homeController
                      .productData!.products![index].title
                      .toString(),
                  description: homeController
                      .productData!.products![index].description
                      .toString(),
                  url: homeController
                      .productData!.products![index].thumbnail
                      .toString(),
                  price: homeController
                      .productData!.products![index].price
                      .toString(),
                  dynamicRating: homeController
                      .productData!.products![index].rating,
                  brand: homeController
                      .productData!.products![index].brand
                      .toString(),
                  category: homeController
                      .productData!.products![index].category
                      .toString(),
                  additionalItems: homeController
                      .productData!.products![index].images!
                      .map((image) => image.toString())
                      .toList(),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: AppColors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            TSizes.cardRadiusLg),
                        child: Image.network(
                          homeController.productData
                              ?.products![index].thumbnail
                              .toString() ??
                              AppImages.carousalSlider2,
                          fit: BoxFit.fill,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 219,
                      color: AppColors.white,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Use MainAxisAlignment.spaceBetween
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TText(
                                text: homeController
                                    .productData?.products![index].title
                                    .toString() ??
                                    'Places',
                                fontSize: TSizes.fontSizeMd,
                                color: Colors.grey[800],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                    TText(
                                      text: homeController
                                          .productData?.products![index].rating
                                          .toString() ??
                                          '5',
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: AppColors.black,
                                ),
                                SizedBox(width: 5),
                                TText(
                                  text: homeController
                                      .productData?.products![index].category
                                      .toString() ??
                                      'location',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
