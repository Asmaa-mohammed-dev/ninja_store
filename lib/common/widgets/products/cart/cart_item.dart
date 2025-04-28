import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCartItem extends StatelessWidget {
  const NCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        NRoundedImage(
          imageUrl: NImages.productImage1,
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        ),
        const SizedBox(width: NSizes.spaceBtwItems),
        //Title, Price, Size
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: NBransTitleWithVerifiedIcon(title: 'المراعي')),
            NProductTitleText(title: 'زبادي طبيعي', maxLines: 1),

            //Attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' اللون ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 21,
                    ),
                  ),
                  TextSpan(
                    text: ' أزرق ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
