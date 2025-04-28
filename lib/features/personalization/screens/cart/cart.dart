import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/icons/n_circular_icon.dart';
import 'package:ninja_store/common/widgets/products/cart/add_rmove_button.dart';
import 'package:ninja_store/common/widgets/products/cart/cart_item.dart';
import 'package:ninja_store/common/widgets/texts/product_price.dart';
import 'package:ninja_store/utils/constants/colors.dart';

import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(
          title: Text(
            'سلة المشتريات',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
            ),
          ),
          showBackArrow: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder:
                (_, __) => const SizedBox(height: NSizes.spaceBtwSections),
            itemCount: 4,
            itemBuilder:
                (_, index) => Column(
                  children: [
                    NCartItem(),
                    SizedBox(height: NSizes.spaceBtwItems),
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
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('إنهاء الطلب \$256.0'),
          ),
        ),
      ),
    );
  }
}
