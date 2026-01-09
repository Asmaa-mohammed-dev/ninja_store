import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/category_controllers.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/features/shop/screens/all_products/all_products.dart';
import 'package:ninja_store/features/shop/screens/home/store/widgets/category_brands.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class NCategoryTab extends StatelessWidget {
  const NCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
           CategoryBrands(category: category),
              const SizedBox(height: NSizes.spaceBtwItems),

              //Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  //Helper Function: Handle Loader, No Record, Or Error Message
                  final response= NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot, loader: const NVerticalProductShimmer());
                  if(response != null) return response;
                  //Record Found!
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      NsectionHeading(
                        title: 'ربما تعجبك ',
                        showActionButton: true,
                        onPressed: () => Get.to(AllProducts(title: category.name,
                        futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1)
                        )),
                      ),
                      const SizedBox(height: NSizes.spaceBtwItems),
                  NGridLayout(
                    itemCount: products.length,
                    itemBuilder:
                        (_, index) =>
                            NProductCardVertical(product: products[index]),
                  ),
                    ],
                  );
                }
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
// import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
// import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
// import 'package:ninja_store/common/widgets/texts/section_heading.dart';
// import 'package:ninja_store/features/shop/controllers/category_controllers.dart';
// import 'package:ninja_store/features/shop/models/category_model.dart';
// import 'package:ninja_store/features/shop/screens/all_products/all_products.dart';
// import 'package:ninja_store/features/shop/screens/home/store/widgets/category_brands.dart';
// import 'package:ninja_store/utils/constants/sizes.dart';
// import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

// class NCategoryTab extends StatelessWidget {
//   const NCategoryTab({super.key, required this.category});
//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final controller = CategoryController.instance;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(NSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CategoryBrands(category: category),
//             const SizedBox(height: NSizes.spaceBtwItems),

//             /// Products List
//             FutureBuilder(
//               future: controller.getCategoryProducts(categoryId: category.id),
//               builder: (context, snapshot) {
//                 final response = NCloudHelperFunctions.checkMultiRecordSate(
//                   snapshot: snapshot,
//                   loader: const NVerticalProductShimmer(),
//                 );

//                 if (response != null) return response;

//                 final products = snapshot.data!;

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     NsectionHeading(
//                       title: 'ربما يعجبك',
//                       showActionButton: true,
//                       onPressed: () => Get.to(() => AllProducts(
//                             title: category.name,
//                             futureMethod: controller.getCategoryProducts(
//                               categoryId: category.id,
//                               limit: -1,
//                             ),
//                           )),
//                     ),
//                     const SizedBox(height: NSizes.spaceBtwItems),

//                     NGridLayout(
//                       itemCount: products.length,
//                       itemBuilder: (_, index) =>
//                           NProductCardVertical(product: products[index]),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
