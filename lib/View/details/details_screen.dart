import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';

import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/common/text/text.dart';
/*class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.description,
    this.additionalItems, // Optional list for additional items
  });

  final String? image;
  final String? title;
  final String? rating;
  final String? description;
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
}*/

class PlaceDetails extends StatelessWidget {
  final String? name;
  final String? title;
  final String? description;
  final String? brand;
  final String? price;
  final String? url;
  final double? dynamicRating;
  final String? category;
  final List<String>? additionalItems;

  const PlaceDetails(
      {Key? key,
      this.name,
      this.title,
      this.description,
      this.brand,
      this.price,
      this.url,
      this.dynamicRating,
      this.category,
      this.additionalItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                url!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TText(
                    text: title!,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: AppColors.black,
                          ),
                          SizedBox(width: 5),
                          TText(
                            text: brand!,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            size: 18,
                            color: Colors.black,
                          ),
                          TText(
                            text: price!,
                            fontSize: 16,
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TText(
                    text: description!,
                    fontSize: 16,
                  ),
                  SizedBox(height: 20),
                  TText(
                    text: 'Photo Gallery',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  if (additionalItems != null &&
                      additionalItems!.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: additionalItems!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  additionalItems![index],
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 20),
                  TText(
                    text: 'Nearby Places',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  // Replace with your nearby places widget
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        url!,
                      ),
                    ),
                    title: TText(
                      text: title!,
                      fontSize: 16,
                    ),
                    subtitle: TText(
                      text: category!,
                      fontSize: 14,
                    ),
                  ),
                  // Add reviews and ratings widget here
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: TText(
                      text: 'Reviews and Ratings',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Column(
                      children: [
                        // Add your review items here
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(title!),
                          subtitle: Text(category!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedRatingStars(
                                initialRating: 3.5,
                                minRating: 0.0,
                                maxRating: 5.0,
                                filledColor: Colors.amber,
                                emptyColor: Colors.grey,
                                filledIcon: Icons.star,
                                halfFilledIcon: Icons.star_half,
                                emptyIcon: Icons.star_border,
                                onChanged: (double rating) {
                                  // Handle the rating change here
                                  print('Rating: $rating');
                                },
                                displayRatingValue: true,
                                interactiveTooltips: true,
                                customFilledIcon: Icons.star,
                                customHalfFilledIcon: Icons.star_half,
                                customEmptyIcon: Icons.star_border,
                                starSize: 18.0,
                                animationDuration: Duration(milliseconds: 300),
                                animationCurve: Curves.easeInOut,
                                readOnly: false,
                              ),
                            ],
                          ),
                        ),
                        // Add more review items as needed
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: TText(
                      text: 'Local Events and Activities',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Column(
                      children: [
                        // Add your event items here
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(title!),
                          subtitle: Text(category!),
                        ),
                      ],
                    ),
                  ),

                  // Add personalized recommendations here
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: TText(
                      text: 'Personalized Recommendations',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Column(
                      children: [
                        // Add your recommendation items here
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(title!),
                          subtitle: Text(category!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
