import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBottomAddToCart extends StatelessWidget {
  const NBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: NSizes.defaultSpace,
        vertical: NSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: NColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(NSizes.cardRadiuslg),
          topRight: Radius.circular(NSizes.cardRadiuslg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const NCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: NColors.darkerGrey,
                width: 40,
                height: 40,
                color: NColors.white,
              ),
              const SizedBox(width: NSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: NSizes.spaceBtwItems),
              const NCircularIcon(
                icon: Iconsax.add,
                backgroundColor: NColors.darkerGrey,
                width: 40,
                height: 40,
                color: NColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(NSizes.md),
              backgroundColor: NColors.black,
              side: const BorderSide(color: NColors.black),
            ),
            child: const Text('أضف إلى عربة التسوق'),
          ),
        ],
      ),
    );
  }
}
