import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NVerticalImageText extends StatelessWidget {
  const NVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = NColors.white,
    this.backgroundColor = NColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: NSizes.spaceBtwItems),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Circular Icon
              NCircularImage(
                image: image,
                height: 56,
                fit: BoxFit.fitWidth,
                padding: NSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: NColors.dark,
              ),

              //text
              SizedBox(height: NSizes.spaceBtwItems / 2),
              SizedBox(
                width: 55,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 13,
                      color: textColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
