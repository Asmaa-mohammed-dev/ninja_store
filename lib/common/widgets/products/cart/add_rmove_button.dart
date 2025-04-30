import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductQuantityWithAddAndMinus extends StatelessWidget {
  const NProductQuantityWithAddAndMinus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 70),
        //Add remove Button
        Row(
          children: [
            NCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: NSizes.md,
              color: NColors.black,
              backgroundColor: NColors.light,
            ),
            const SizedBox(width: NSizes.spaceBtwItems),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: NSizes.spaceBtwItems),
            //Add add Button
            NCircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: NSizes.md,
              color: NColors.white,
              backgroundColor: NColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
