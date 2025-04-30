import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/products/cart/add_rmove_button.dart';
import 'package:ninja_store/common/widgets/products/cart/cart_item.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCartItems extends StatelessWidget {
  const NCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (_, __) => const SizedBox(height: NSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder:
          (_, index) => Column(
            children: [
              NCartItem(),
              if (showAddRemoveButtons) SizedBox(height: NSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 70),
                        NProductQuantityWithAddAndMinus(),
                      ],
                    ),
                    NProductPrice(price: '256'),
                  ],
                ),
            ],
          ),
    );
  }
}
