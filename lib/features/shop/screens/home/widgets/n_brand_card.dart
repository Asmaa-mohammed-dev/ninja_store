import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/enums.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBrandCard extends StatelessWidget {
  const NBrandCard({super.key, required this.showBorder, this.onTap, required this.brand});
final BrandModel brand;

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NRoundedContainer(
        padding: const EdgeInsets.all(NSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: NCircularImage(
                backgroundColor: Colors.transparent,
                isNetworkImage: true,
                overlayColor: NColors.black,
                image: brand.image,
              ),
            ),
            const SizedBox(height: NSizes.spaceBtwItems / 2),
            //Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NBransTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                  '${brand.productsCount ?? 0} مُنتج',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 10,
                    ),
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
