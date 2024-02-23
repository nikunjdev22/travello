import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/image_constant.dart';
import '../../../Constant/colors_constant.dart';
import '../../../Utils /sizes.dart';
import '../../../common/text/text.dart';
import '../../controller/home/home_controller.dart';
import '../../details/details_screen.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeController.productData?.products?.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.white,
          margin: const EdgeInsets.all(10),
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
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 120, // Set the desired width
                      height: 100, // Set the desired height
                      child: Image.network(
                        homeController.productData?.products![index].thumbnail.toString() ??
                            AppImages.carousalSlider2,
                        fit: BoxFit.fill, // Adjust the BoxFit as needed
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TText(
                          text: homeController.productData?.products![index].title.toString() ?? 'Places',
                          fontSize: TSizes.fontSizeMd,
                          color: Colors.grey[800],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: AppColors.black,
                            ),
                            SizedBox(width: 5),
                            TText(
                              text: homeController.productData?.products![index].category.toString() ?? 'location',
                              fontSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 5),
                            TText(
                              text: homeController.productData?.products![index].rating.toString() ?? '5',
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
