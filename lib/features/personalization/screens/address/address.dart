import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:ninja_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: NColors.primary,
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          child: Icon(Iconsax.add, color: NColors.white),
        ),
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'العنوان',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 23,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              children: [
                NSingleAddress(selectedAddress: false),
                NSingleAddress(selectedAddress: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
