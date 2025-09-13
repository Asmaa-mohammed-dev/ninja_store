import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/features/shop/controllers/banner_controller.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/n_circular_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NpromoSider extends StatelessWidget {
  const NpromoSider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      //Loader
      if (controller.isLoading.value)
        return const NShimmerEffect(width: double.infinity, height: 190);
      //No data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('لا توجد بيانات'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged:
                    (index, _) => controller.updatePageIndicator(index),
              ),
              items:
                  controller.banners
                      .map(
                        (banner) => NRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: NSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      NCircularContainer(
                        width: 20,
                        height: 4,
                        margin: EdgeInsets.only(left: 10),
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                                ? NColors.primary
                                : NColors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
