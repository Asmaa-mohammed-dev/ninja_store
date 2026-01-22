import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NFavouriteIcon extends StatelessWidget {
  const NFavouriteIcon({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      ()=>  NCircularIcon(
        
                        icon:controller.isFavourite(productId) ? Iconsax.heart5 :Iconsax.heart,
                        color:controller.isFavourite(productId) ? NColors.error : null,
                        onPressed: () => controller.toggleFavoriteProducts(productId),
                      ),
    );
  }
}