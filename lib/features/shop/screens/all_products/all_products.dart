import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/products/sortable/n_sortable_product.dart';
import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ninja_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

final String title;
final Query? query;
final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(title: Text(title), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                //check the state of the FutureBuilder snapshot
                const loader = NVerticalProductShimmer();
   final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader);
   //Returns approporiate widget based on snapshot state
   if(widget != null) return widget;            

//Products found
final products = snapshot.data!;
                return NSortableProducts(products: products);
              }
            ),
          ),
        ),
      ),
    );
  }
}
