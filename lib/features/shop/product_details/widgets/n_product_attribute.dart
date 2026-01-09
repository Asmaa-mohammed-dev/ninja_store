import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/chip/choice_chip.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/shop/controllers/product/variation_controller.dart';
import 'package:ninja_store/features/shop/models/product_model.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductAttribute extends StatelessWidget {
  const NProductAttribute({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(
        () => Column(
          children: [
            //Selected Attribute Pricing & Description
            //Display variation price and stock when some variation is se
            if (controller.selectedVariation.value.id.isNotEmpty)
              NRoundedContainer(
                padding: const EdgeInsets.all(NSizes.md),
                backgroundColor: NColors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title, Price and Stock Status
                    Row(
                      children: [
                        NsectionHeading(
                          title: 'المواصفات',
                          showActionButton: false,
                        ),
                        SizedBox(width: NSizes.spaceBtwItems),
                        Column(
                          children: [
                            Row(
                              children: [
                                const NProductTitleText(
                                  title: '  السعر',
                                  smallSize: true,
                                ),
                                if (controller
                                        .selectedVariation
                                        .value
                                        .salePrice >
                                    0)
                                  Text(
                                    '\$${controller.selectedVariation.value.salePrice}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                const SizedBox(width: NSizes.spaceBtwItems),

                                //Sale Price
                                NProductPrice(
                                  price: controller.getVariationPrice(),
                                ),
                              ],
                            ),
                            const SizedBox(width: NSizes.spaceBtwItems),

                            //Stock
                            Row(
                              children: [
                                const NProductTitleText(
                                  title: '  المخزن',
                                  smallSize: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    //Variation description
                    NProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            SizedBox(height: NSizes.spaceBtwItems),

            //Attribute
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  product.productAttributes!
                      .map(
                        (attribute) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NsectionHeading(
                              title: attribute.name ?? '',
                              showActionButton: false,
                            ),
                            SizedBox(height: NSizes.spaceBtwItems / 2),
                            Obx(
                              () => Wrap(
                                spacing: 8,
                                children:
                                    attribute.values!.map((attributeValue) {
                                      final isSelected =
                                          controller
                                              .selectedAttributes[attribute
                                              .name] ==
                                          attributeValue;
                                      final available = controller
                                          .getAttributesAvailabilityInVaraition(
                                            product.productVariations!,
                                            attribute.name!,
                                          )
                                          .contains(attributeValue);

                                      return NChoiceChip(
                                        text: attributeValue,
                                        selected: isSelected,
                                        onSelected:
                                            available
                                                ? (selected) {
                                                  if (selected && available) {
                                                    controller
                                                        .onAttributeSelected(
                                                          product,
                                                          attribute.name ?? '',
                                                          attributeValue,
                                                        );
                                                  }
                                                }
                                                : null,
                                      );
                                    }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
