import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/products/cart/cart_item.dart';
import 'package:ninja_store/features/personalization/screens/checkouts/checkout.dart';

import 'package:ninja_store/utils/constants/sizes.dart';

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
          child: NCartItem(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('إنهاء الطلب \$256.0'),
          ),
        ),
      ),
    );
  }
}
