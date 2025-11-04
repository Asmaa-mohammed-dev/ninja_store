import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBrandSowcase extends StatelessWidget {
  const NBrandSowcase({super.key, required this.images});

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return NRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(NSizes.md),
      borderColor: NColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand with products count
           NBrandCard(showBorder: false, brand: BrandModel.empty()),
          const SizedBox(height: NSizes.spaceBtwItems),

          //Brand Top 3 Product Images
          Row(
            children:
                images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: NRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(NSizes.md),
      margin: const EdgeInsets.only(right: NSizes.sm),
      backgroundColor: NColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
