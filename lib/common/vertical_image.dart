import 'package:flutter/material.dart';
import 'package:travello/Constant/colors_constant.dart';
import '../Utils /sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwIteams),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Container(
                  child: Text(image),
                  color: Colors.orange,
                )
                /*Image.network(
                    image,
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                  color:  AppColors.primaryBackground
                ),*/
              ),
            ),

            ///Text
            const SizedBox(
              height: TSizes.spaceBtwIteams / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
