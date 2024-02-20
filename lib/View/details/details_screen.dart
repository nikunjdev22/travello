import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Utils%20/sizes.dart';
import '../../common/text.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.additionalItems, // Optional list for additional items
  });

  final String image;
  final String title;
  final String description;
  final List<String>? additionalItems; // Optional list for additional items

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
              child: Image.network(image),
            ),
            SizedBox(height: TSizes.md),
            TText(
              text: title,
              fontSize: TSizes.fontSizeXl,
              color: AppColors.black,
            ),
            SizedBox(height: TSizes.md),
            Text(description),
            SizedBox(height: TSizes.md),
            if (additionalItems != null && additionalItems!.isNotEmpty)
              SizedBox(
                height: 100, // Define the height of the horizontal ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: additionalItems!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(additionalItems![index])),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
