import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/product/brand_controller.dart';
import 'package:ninja_store/features/shop/screens/brands/brand_product.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text('العلامات الرائجة'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Heading
                NsectionHeading(title: 'العلامات الرائجة'),
                SizedBox(height: NSizes.spaceBtwItems),

                //Brands
                Obx(
                        (){
                          if(brandController.isLoading.value) return NBrandShimmer();
                           if(brandController.allBrands.isEmpty) {
                            return Center(
                              child: Text('لا توجد بيانات', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                            );
                           }
                          return NGridLayout(
                              mainAxisExtent: 80,
                          itemCount: brandController.allBrands.length,
                        
                          itemBuilder: (_, index) {
                            final brand = brandController.allBrands[index];
                            return  NBrandCard(showBorder: true, brand: brand,
                           onTap: () =>Get.to(() => BrandProducts(brand: brand,)), );
                          },
                        );
                        }
                        
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
