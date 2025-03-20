import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.only(right: NSizes.spaceBtwItems),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(NSizes.sm),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    // color: NColors.dark,
                  ),
                ),
              ),

              //text
              SizedBox(height: NSizes.spaceBtwItems / 2),
              SizedBox(
                width: 70,
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
