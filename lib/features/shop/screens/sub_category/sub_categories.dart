import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/products/product_card_horizontal.dart';
import 'package:ninja_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/category_controllers.dart';
import 'package:ninja_store/features/shop/models/category_model.dart';
import 'package:ninja_store/features/shop/screens/all_products/all_products.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category,});

final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text(category.name), showBackArrow: true),
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
                FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    //Handle Loader, No Record, Or Error Message
                    const loader = THorizontalProductShimmer();
                    final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot, loader: loader);
                    if(widget != null) return widget;
                    //Record found
                    final subCategories = snapshot.data!;

return ListView.builder(shrinkWrap: true,
itemCount: subCategories.length,
physics: const NeverScrollableScrollPhysics(),
itemBuilder: (_,index){
  final subCategory = subCategories[index];
return FutureBuilder(
  future: controller.getCategoryProducts(categoryId: subCategory.id),
  builder: (context, snapshot) {


       //Handle Loader, No Record, Or Error Message
            
                    final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot, loader: loader);
                    if(widget != null) return widget;
                    //Congratulations Record found.
                    final products = snapshot.data!;
    return Column(
                          children: [
                            //heading
                            NsectionHeading(title: subCategory.name,onPressed: () => Get.to(()=> AllProducts(title:subCategory.name,
                            futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),))),
                         
                    
                    SizedBox(height: NSizes.spaceBtwItems / 2),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder:
                            (context, index) =>
                                const SizedBox(width: NSizes.spaceBtwItems),
                        itemBuilder: (context, index) => NProductCardHorizontal(product: products[index]),
                         
                              ),
                                ),
                              ],
                            );
  }
);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
