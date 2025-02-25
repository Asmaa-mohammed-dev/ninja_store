// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: NDeviceUtils.getBottomNavigationBarHeight(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.black,
          ),
          child: const Icon(
            Iconsax.arrow_circle_left, // 🔹 تبديل الاتجاه تلقائيًا
            size: 30, // ✅ حجم أكبر لجاذبية أفضل
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
