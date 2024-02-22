import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/common/text/text.dart';

class PlaceDetails extends StatefulWidget {
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
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  static final customCacheManager = new CacheManager(Config('customCacheKey',
      stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 100));

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
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    cacheManager: customCacheManager,
                    key: UniqueKey(),
                    fit: BoxFit.fill,
                    imageUrl: widget.url!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ],
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
                    text: widget.title!,
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
                            text: widget.brand!,
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
                            text: widget.price!,
                            fontSize: 16,
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TText(
                    text: widget.description!,
                    fontSize: 16,
                  ),
                  SizedBox(height: 20),
                  TText(
                    text: 'Photo Gallery',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  if (widget.additionalItems != null &&
                      widget.additionalItems!.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.additionalItems!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  widget.additionalItems![index],
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
                        widget.url!,
                      ),
                    ),
                    title: TText(
                      text: widget.title!,
                      fontSize: 16,
                    ),
                    subtitle: TText(
                      text: widget.category!,
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
                          title: Text(widget.title!),
                          subtitle: Text(widget.category!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: widget.dynamicRating!,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                updateOnDrag: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
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
                          title: Text(widget.title!),
                          subtitle: Text(widget.category!),
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
                          title: Text(widget.title!),
                          subtitle: Text(widget.category!),
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
