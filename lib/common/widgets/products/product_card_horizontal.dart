import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/styles/shadows.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductCardHorizontal extends StatelessWidget {
  const NProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [NSadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(NSizes.productImageRadius),
          color: const Color.fromARGB(255, 241, 241, 241),
        ),
        child: Row(
          children: [
            //Thumnail
            NRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(NSizes.sm),
              backgroundColor: NColors.light,
              child: Stack(
                //Thumnail
                children: [
                  //Thumnail Image
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: Padding(
                      padding: EdgeInsets.all(NSizes.spaceBtwItems),
                      child: NRoundedImage(
                        imageUrl: NImages.productImage1,
                        applyImageRadius: true,
                      ),
                    ),
                  ),
                  //Sale Tag
                  Positioned(
                    top: 4,
                    child: NRoundedContainer(
                      radius: NSizes.sm,
                      backgroundColor: NColors.secondary.withValues(alpha: 0.8),
                      padding: EdgeInsets.symmetric(
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
            //Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: NSizes.sm, right: NSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NProductTitleText(
                          title: ' قشطة الصافي علامة كلها جودةعالية',
                          smallSize: true,
                        ),
                        SizedBox(height: NSizes.spaceBtwItems / 2),
                        NBransTitleWithVerifiedIcon(title: 'صافي'),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: NProductPrice(price: '256,0')),

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

                            child: const Icon(
                              Iconsax.add,
                              color: NColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
