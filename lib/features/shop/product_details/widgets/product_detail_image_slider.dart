import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/images/n_rounde_image.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductImageSlider extends StatelessWidget {
  const NProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Image(image: AssetImage(NImages.productImage1)),
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
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder:
                      (_, __) => const SizedBox(width: NSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => NRoundedImage(
                        width: 80,
                        backgroundColor: NColors.white,
                        border: Border.all(color: NColors.primary),
                        padding: const EdgeInsets.all(NSizes.sm),
                        imageUrl: NImages.Almarai,
                      ),
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
