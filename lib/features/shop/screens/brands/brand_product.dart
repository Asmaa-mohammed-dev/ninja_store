import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/products/sortable/n_sortable_product.dart';
import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ninja_store/features/shop/controllers/product/brand_controller.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text(brand.name)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Brand Detail
                NBrandCard(showBorder: true, brand:brand),
                SizedBox(height: NSizes.spaceBtwSections),
                FutureBuilder(
                  future: controller.getBrandProducts(brandId:brand.id),
                  builder: (context, snapshot) {
                    //Handle loader, No Record, OR Erroe Message
                    const loader = NVerticalProductShimmer();
                    final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader:loader);
                 

                    if(widget != null) return widget;
                       //Record Found!
                       final brandProducts = snapshot.data!;
                       print('Brand ${brand.name} products: ${brandProducts.length}');

                    return NSortableProducts(products:brandProducts);
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
