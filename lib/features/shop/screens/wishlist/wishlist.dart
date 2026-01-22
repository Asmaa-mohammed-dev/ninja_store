import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/loaders/animation_loader.dart';
import 'package:ninja_store/common/widgets/products/product_card_vertical.dart';
import 'package:ninja_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ninja_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/home.dart';
import 'package:ninja_store/navigation_menu.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/cloud_helper_function.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
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
          child: Obx(
            ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                //Nothing Found Widget
            final emptyWidget = NAnimationLoaderWidget(
              text: 'لا يوجد منتج في قائمة المفضلة',
              animation: NImages.docerAnimation,
              showAction: true,
              actionText: 'هيا لنضف المزيد',
              onActionPressed: () =>Get.off(() => const NavigationMenu()),
            );
                
                const loader = NVerticalProductShimmer(itemCount: 6,);
                final widget = NCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader : loader, nothingFound: emptyWidget);
                if(widget != null) return widget;
                final products = snapshot.data!;
                return NGridLayout(
                  itemCount: products.length,
                  itemBuilder:
                      (_, index) =>
                          NProductCardVertical(product: products[index]),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
