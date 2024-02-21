import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travello/Constant/colors_constant.dart';
import 'package:travello/Constant/image_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travello/View/Home/home_screen.dart';
import 'package:travello/common/text/text.dart';

List<String> images = [
  AppImages.carousalSlider1,
  AppImages.carousalSlider2,
  AppImages.carousalSlider3,
  AppImages.carousalSlider4,
  AppImages.carousalSlider5,
];

class CarousalScreen extends StatelessWidget {
  const CarousalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Builder(
          builder: (context) {
            final double width = MediaQuery.of(context).size.width;
            final double height = MediaQuery.of(context).size.height;
            return CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: false,
                // autoPlay: false,
              ),
              items: images
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          height: height,
                        )),
                      ))
                  .toList(),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Experience ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: '\nAdventure',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => HomeScreen()),
                    child: TText(
                      text: 'Explore',
                      color: AppColors.black,
                    )),
              ),
              SizedBox(height: 200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TText(
                      text: 'India Travel Organization',
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildParticipantInfo(
                          Icons.people_outline, '5000+', 'participants'),
                      _buildParticipantInfo(
                          Icons.house_siding_sharp, '50+', 'Places'),
                      _buildParticipantInfo(
                          Icons.house_siding_sharp, '5000+', 'participants'),
                      _buildParticipantInfo(Icons.calendar_month, '2', 'Years'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildParticipantInfo(IconData icon, String count, String label) {
    return Container(
      width: 190,
      padding: EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 35,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TText(
                text: count,
                color: AppColors.white,
                fontSize: 20,
              ),
              TText(
                text: label,
                color: AppColors.white,
                fontSize: 18,
              )
            ],
          ),
        ],
      ),
    );
  }
}
