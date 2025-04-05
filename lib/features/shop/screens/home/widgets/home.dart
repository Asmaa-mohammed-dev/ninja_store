import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/primary_header_container.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/search_container.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_appbar.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_categories.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/promo_slider.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  NHomeAppBar(),
                  SizedBox(height: NSizes.spaceBtwSections),
                  //searchbar
                  NSearchContainer(text: 'أبحث عن ............', onTap: () {}),
                  //heading
                  SizedBox(height: NSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(right: NSizes.defaultSpace),
                    child: Column(
                      children: [
                        NsectionHeading(
                          title: 'التصنيفات',
                          showActionButton: false,
                          textColor: NColors.white,
                        ),
                        SizedBox(height: NSizes.spaceBtwSections),
                        //categories
                        NHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: NSizes.spaceBtwSections + 12),
                ],
              ),
            ),
            //Home
            Padding(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              child: Column(
                children: [
                  NpromoSider(
                    banners: [
                      NImages.prombanner1,
                      NImages.prombanner2,
                      NImages.prombanner3,
                    ],
                  ),
                  SizedBox(height: NSizes.spaceBtwSections),
                  NsectionHeading(title: 'الأطعمة الرائجة', onPressed: () {}),
                  SizedBox(height: NSizes.spaceBtwItems),

                  //popular products
                  NGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => NProductCardVertical(),
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
