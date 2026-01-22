import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text.dart';
import 'package:ninja_store/common/widgets/texts/n_brand_title_text_with_verified_icon.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/features/shop/controllers/product/product_controller.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/enums.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductMetaData extends StatelessWidget {
  const NProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Price & Sale Price
          Row(
            children: [
              NRoundedContainer(
                radius: NSizes.sm,
                backgroundColor: NColors.secondary.withAlpha(204),
                padding: const EdgeInsets.symmetric(
                  horizontal: NSizes.sm,
                  vertical: NSizes.xs,
                ),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.apply(color: NColors.black),
                ),
              ),
              const SizedBox(width: NSizes.spaceBtwItems),

              //Price
              if (product.productType == ProductType.single.toString() &&
                  product.salePrice > 0)
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              if (product.productType == ProductType.single.toString() &&
                  product.salePrice > 0)
                const SizedBox(width: NSizes.spaceBtwItems),
              NProductPrice(
                price: controller.getProductPrice(product),
                isLarge: true,
              ),
            ],
          ),
          //Title
          NProductTitleText(title: product.title),
          const SizedBox(height: NSizes.spaceBtwItems / 1.5),

          //Stock Status
          Row(
            children: [
              const NProductTitleText(title: 'الحالة'),
              const SizedBox(width: NSizes.spaceBtwItems),

              Text(
                controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          const SizedBox(height: NSizes.spaceBtwItems / 1.5),
          //Brand
          Row(
            children: [
              NCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                width: 32,
                height: 32,
                overlayColor: NColors.black,
              ),
              NBransTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
