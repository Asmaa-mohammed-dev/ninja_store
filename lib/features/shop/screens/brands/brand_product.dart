import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/products/sortable/n_sortable_product.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Scaffold(
        appBar: NAppBar(title: Text('المراعي')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                //Brand Detail
                NBrandCard(showBorder: true),
                SizedBox(height: NSizes.spaceBtwSections),
                NSortableProducts(products:[]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
