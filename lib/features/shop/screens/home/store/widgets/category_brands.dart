import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/brands/brand_show_case.dart';
import 'package:ninja_store/common/widgets/shimmer/n_box_shimmer.dart';
import 'package:ninja_store/common/widgets/shimmer/n_list_tile_shimmer.dart';
import 'package:ninja_store/features/shop/controllers/product/brand_controller.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key,required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),

      builder: (context, snapshot) {
        //Handle Loader, No Record, OR Error Message
        const loader = Column(
          children: [
            NListTileShimmer(),
            SizedBox(height: NSizes.spaceBtwItems),
            NBoxShimmer(),
            SizedBox(height: NSizes.spaceBtwItems),
          ],
        );
        final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader);
        if(widget != null) return widget;
        // Record Found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder:(_,index){
  final brand = brands[index];
  return FutureBuilder(
    future: controller.getBrandProducts(brandId:brand.id,limit:3),
    builder: (context, snapshot) {
      ///Handle Loader, No Record, OR Error Message
      final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader);
        if(widget != null) return widget;
        // Record Found!
        final products = snapshot.data!;

      return NBrandSowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
    }
  );
}
        );
      }
    );
  }
}