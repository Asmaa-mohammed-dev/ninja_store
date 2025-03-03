import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NSocialButtons extends StatelessWidget {
  const NSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: NColors.grey, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
              width: NSizes.iconMd,
              height: NSizes.iconMd,

              image: AssetImage(NImages.google),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(width: NSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: NColors.grey, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
              width: NSizes.iconMd,
              height: NSizes.iconMd,
              image: AssetImage(NImages.facebook),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
