import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/products/product_card_horizontal.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text('الطعام'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Banner
                NRoundedImage(
                  width: double.infinity,

                  imageUrl: NImages.prombanner3,
                  applyImageRadius: true,
                ),
                const SizedBox(height: NSizes.spaceBtwSections),

                //Sub Categories
                Column(
                  children: [
                    //heading
                    NsectionHeading(title: 'الدجاج',onPressed: () {}),
                  ],
                ),
                SizedBox(height: NSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder:
                        (context, index) =>
                            const SizedBox(width: NSizes.spaceBtwItems),
                    itemBuilder: (context, index) => NProductCardHorizontal(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
