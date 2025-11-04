import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/cart_menu_icon/cart_menu_icon.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/search_container.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/category_controllers.dart';
import 'package:ninja_store/features/shop/controllers/product/brand_controller.dart';
import 'package:ninja_store/features/shop/screens/brands/all_brands.dart';
import 'package:ninja_store/features/shop/screens/brands/brand_product.dart';
import 'package:ninja_store/features/shop/screens/home/store/widgets/category_tab.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: NAppBar(
          title: Text(
            'التسوق',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
            ),
          ),
          actions: [
            NCartCountericon(onPressed: () {}, iconColor: NColors.black),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBosIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: NColors.white,
                expandedHeight: 380,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(NSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Search bar
                      SizedBox(height: NSizes.spaceBtwItems),
                      NSearchContainer(
                        text: 'أبحث عن ...',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: NSizes.spaceBtwSections),
                      //Featured Brands
                      NsectionHeading(
                        title: 'العلامات الرائجة',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      SizedBox(height: NSizes.spaceBtwSections / 1.5),
                      Obx(
                        (){
                          if(brandController.isLoading.value) return NBrandShimmer();
                           if(brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text('لا توجد بيانات', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                            );
                           }
                          return NGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return  NBrandCard(showBorder: false, brand: brand,
                            onTap: ()=> Get.to(() => BrandProducts(brand: brand)) ,);
                          },
                        );
                        }
                        
                      ),
                    ],
                  ),
                ),
                //Tabs
                bottom: NTabBar(
                  tabs:
                      categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                categories
                    .map((category) => NCategoryTab(category: category))
                    .toList(),
          ),
        ),
      ),
    );
  }
}
