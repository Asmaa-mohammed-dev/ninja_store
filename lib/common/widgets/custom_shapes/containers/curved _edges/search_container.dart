import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class NSearchContainer extends StatelessWidget {
  const NSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    required this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace),
        child: Container(
          width: NDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(NSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? NColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(NSizes.cardRadiuslg),
            border: showBorder ? Border.all(color: NColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: NColors.darkerGrey),
              SizedBox(width: NSizes.spaceBtwItems),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
