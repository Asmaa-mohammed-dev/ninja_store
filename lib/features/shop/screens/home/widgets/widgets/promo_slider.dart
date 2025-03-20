import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/features/shop/controllers/home_controller.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/n_circular_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NpromoSider extends StatelessWidget {
  const NpromoSider({super.key, required this.banners});
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => NRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: NSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
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
}
