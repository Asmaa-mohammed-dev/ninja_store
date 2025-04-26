import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/enums.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductMetaData extends StatelessWidget {
  const NProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Price & Sale Price
          Row(
            children: [
              NRoundedContainer(
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
              const SizedBox(width: NSizes.spaceBtwItems),

              //Price
              Text(
                '\$250',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: NSizes.spaceBtwItems),
              const NProductPrice(price: '175', isLarge: true),
            ],
          ),
          //Title
          const NProductTitleText(title: 'زبادي المراعي'),
          const SizedBox(height: NSizes.spaceBtwItems / 1.5),

          //Stock Status
          Row(
            children: [
              const NProductTitleText(title: 'الحالة'),
              const SizedBox(width: NSizes.spaceBtwItems),

              Text('في المخزن', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),

          const SizedBox(height: NSizes.spaceBtwItems / 1.5),
          //Brand
          Row(
            children: [
              NCircularImage(
                image: NImages.productImage1,
                width: 32,
                height: 32,
                overlayColor: NColors.black,
              ),
              NBrandTitleText(
                title: 'المراعي',
                brandTextSize: TextSizes.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
