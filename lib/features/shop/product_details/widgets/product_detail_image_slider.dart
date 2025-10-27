import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/features/shop/controllers/product/images_controller.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductImageSlider extends StatelessWidget {
  const NProductImageSlider({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return NCurvedWidget(
      child: Container(
        color: NColors.light,
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(NSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder:
                            (_, __, downloadProgress) =>
                                CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: NColors.primary,
                                ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            //Image Slider
            Positioned(
              left: 0,
              bottom: 30,
              right: NSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder:
                      (_, __) => const SizedBox(width: NSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => Obx(() {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                            images[index];
                        return NRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          backgroundColor: NColors.white,
                          onPressed:
                              () =>
                                  controller.selectedProductImage.value =
                                      images[index],
                          border: Border.all(
                            color:
                                imageSelected
                                    ? NColors.primary
                                    : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(NSizes.sm),
                          imageUrl: images[index],
                        );
                      }),
                ),
              ),
            ),

            //Appbar Icons
            NAppBar(
              showBackArrow: true,
              actions: [NCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
