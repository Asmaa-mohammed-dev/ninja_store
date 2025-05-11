import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/cart_menu_icon/cart_menu_icon.dart';
import 'package:ninja_store/features/personalization/controllers/user_controller.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/shimmer.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NHomeAppBar extends StatelessWidget {
  const NHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return NAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NTexts.homeAppbarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              //Display a shimmer loader while user profile is being loaded
              return const NShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  color: Colors.white,
                  fontSize: 17,
                ),
              );
            }
          }),
        ],
      ),
      actions: [NCartCountericon(onPressed: () {}, iconColor: NColors.white)],
    );
  }
}
