import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final String? url;
  final String? rating;
  final String? category;
  final List<String>? additionalItems;

  const PlaceDetails(
      {Key? key,
      this.name,
      this.title,
      this.description,
      this.brand,
      this.url,
      this.rating,
      this.category,
      this.additionalItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LatLng location =
        LatLng(27.1751, 78.0421); // Example coordinates for Agra, India
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.all(20),
              background: Image.network(
                url!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            brand!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            rating!,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.star_border_outlined,
                            size: 18,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Photo Gallery',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (additionalItems != null && additionalItems!.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: additionalItems!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            width: 150, // Set a fixed width for the container
                            height: 100, // Set a fixed height for the container
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: additionalItems![index] != null
                                  ? Image.network(
                                      additionalItems![index],
                                      fit: BoxFit
                                          .cover, // Ensure the image covers the container
                                    )
                                  : Center(
                                      child:
                                          CircularProgressIndicator()), // Placeholder or loading indicator
                            ),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 20),
                  Text(
                    'Nearby Places',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  // Replace with your nearby places widget
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        url!,
                      ),
                    ),
                    title: Text(
                      title!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      category!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // Add reviews and ratings widget here
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Reviews and Ratings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        // Add your review items here
                        ListTile(
                          title: Text(title!),
                          subtitle: Text(category!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text(rating!),
                            ],
                          ),
                        ),
                        // Add more review items as needed
                      ],
                    ),
                  ),

                  // Add local events and activities here
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Local Events and Activities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        // Add your event items here
                        ListTile(
                          title: Text(title!),
                          subtitle: Text(category!),
                        ),
                      ],
                    ),
                  ),

                  // Add personalized recommendations here
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Personalized Recommendations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        // Add your recommendation items here
                        ListTile(
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
