import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import '../../common/text.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwIteams),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(image)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: TSizes.md,
                ),
                TText(
                  text: title,
                  fontSize: TSizes.fontSizeXl,
                  color: AppColors.black,
                ),
                SizedBox(
                  height: TSizes.md,
                ),
                Text(description)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
