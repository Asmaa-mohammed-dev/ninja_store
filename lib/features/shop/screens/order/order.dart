import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/features/shop/screens/order/widgets/n_order_list.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //AppBar
        appBar: NAppBar(
          title: Text(
            'طلباتي',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 23,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          //Orders
          child: NOrderList(),
        ),
      ),
    );
  }
}
