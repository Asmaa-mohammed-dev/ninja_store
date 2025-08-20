import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/home.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NAppBar(
        title: Text(
          'المفضلة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            fontSize: 21,
          ),
        ),
        actions: [
          NCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              NGridLayout(
                itemCount: 4,
                itemBuilder:
                    (_, index) =>
                        NProductCardVertical(product: ProductModel.empty()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
