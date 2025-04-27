import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/chip/choice_chip.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/common/widgets/texts/product_title_text.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NProductAttribute extends StatelessWidget {
  const NProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          //Selected Attribute Pricing & Description
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
                            Text(
                              '\$25',
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: NSizes.spaceBtwItems),
                            //Sale Price
                            NProductPrice(price: '20'),
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
                              ' في المخزن',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //Variation description
                const NProductTitleText(
                  title: 'هذه تفاصيل المنتج ',
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
            children: [
              NsectionHeading(title: 'الألوان', showActionButton: false),
              SizedBox(height: NSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: [
                  NChoiceChip(
                    text: 'green',
                    selected: true,
                    onSelected: (value) {},
                  ),
                  NChoiceChip(
                    text: 'blue',
                    selected: false,
                    onSelected: (value) {},
                  ),
                  NChoiceChip(
                    text: 'yellow',
                    selected: true,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              NsectionHeading(title: 'الحجم', showActionButton: false),
              SizedBox(height: NSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: [
                  NChoiceChip(
                    text: '1 لتر',
                    selected: true,
                    onSelected: (value) {},
                  ),
                  NChoiceChip(
                    text: '2 لتر',
                    selected: false,
                    onSelected: (value) {},
                  ),
                  NChoiceChip(
                    text: '3 لتر',
                    selected: true,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
