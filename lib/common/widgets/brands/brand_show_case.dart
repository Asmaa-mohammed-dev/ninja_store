import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/features/shop/models/brand_model.dart';
import 'package:ninja_store/features/shop/screens/brands/brand_product.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/n_brand_card.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBrandSowcase extends StatelessWidget {
  const NBrandSowcase({super.key, required this.images, required this.brand});
final BrandModel brand;
  final List<String> images;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(() => BrandProducts(brand: brand)),
      child: NRoundedContainer(
         padding: const EdgeInsets.all(NSizes.md),
        showBorder: true,
       
        borderColor: NColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand with products count
            const SizedBox(height: NSizes.spaceBtwItems),
                   NBrandCard(showBorder: false, brand: brand),

            //Brand Top 3 Product Images
            Row(
              children:
                  images
                      .map((image) => brandTopProductImageWidget(image, context))
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: NRoundedContainer(
      height: 100,
      showBorder: false,
      // padding: const EdgeInsets.all(NSizes.md),
      margin: const EdgeInsets.only(right: NSizes.sm),
      backgroundColor: NColors.light,
      child: CachedNetworkImage(imageUrl: image,
      progressIndicatorBuilder: (context, url , downloadProgress) => const NShimmerEffect(width: 100, height: 100),
      errorWidget: (context, url ,error) => const Icon(Icons.error),),),
    
    
  );
}
