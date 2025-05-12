import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/brands/brand_show_case.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCategoryTab extends StatelessWidget {
  const NCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              NBrandSowcase(
                images: [
                  NImages.productImage1,
                  NImages.productImage2,
                  NImages.productImage3,
                ],
              ),
              const SizedBox(height: NSizes.spaceBtwItems),

              //Products
              NsectionHeading(
                title: 'ربما تعجبك ',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: NSizes.spaceBtwItems),
              NGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => NProductCardVertical(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
