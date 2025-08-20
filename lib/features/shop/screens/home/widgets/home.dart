import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/primary_header_container.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/search_container.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/product_controller.dart';
import 'package:ninja_store/features/shop/screens/all_products/all_products.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_appbar.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/home_categories.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/promo_slider.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                  NpromoSider(),
                  SizedBox(height: NSizes.spaceBtwSections),
                  NsectionHeading(
                    title: 'الأطعمة الرائجة',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),

                  //popular products
                  Obx(() {
                    if (controller.isLoading.value)
                      return const NVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد بيانات',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return NGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder:
                          (_, index) => NProductCardVertical(
                            product: controller.featuredProducts[index],
                          ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
