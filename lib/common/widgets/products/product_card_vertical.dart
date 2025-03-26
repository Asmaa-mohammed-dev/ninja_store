import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/styles/shadows.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductCardVertical extends StatelessWidget {
  const NProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [NSadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(NSizes.productImageRadius),
          color: NColors.white,
        ),
        child: Column(
          children: [
            //Thumnail, wishlist, discount tag
            NRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(NSizes.sm),
              backgroundColor: NColors.light,
              child: Stack(
                children: [
                  Center(
                    child: NRoundedImage(
                      imageUrl: NImages.productImage1,
                      applyImageRadius: true,
                    ),
                  ),
                  //Sale Tag
                  Positioned(
                    top: 4,
                    child: NRoundedContainer(
                      radius: NSizes.sm,
                      backgroundColor: NColors.secondary.withAlpha(204),
                      padding: const EdgeInsets.symmetric(
                        horizontal: NSizes.sm,
                        vertical: NSizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.apply(color: NColors.black),
                      ),
                    ),
                  ),

                  //Favourite icon
                  Positioned(
                    top: 0,
                    left: 0,
                    child: NCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: NSizes.spaceBtwItems / 2),

            //Details
            Padding(
              padding: const EdgeInsets.only(left: NSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NProductTitleText(title: 'قشطة صافي', smallSize: true),
                  const SizedBox(height: NSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'صافي',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MAJALLA',
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: NSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: NColors.primary,
                        size: NSizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Price
                      NProductPrice(price: '35.0'),
                      Container(
                        decoration: const BoxDecoration(
                          color: NColors.dark,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(NSizes.cardRadiusMd),
                            bottomLeft: Radius.circular(
                              NSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: NSizes.iconLg * 1.2,
                          height: NSizes.iconLg * 1.2,

                          child: const Icon(Iconsax.add, color: NColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
