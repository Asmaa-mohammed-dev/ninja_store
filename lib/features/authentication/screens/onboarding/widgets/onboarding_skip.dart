import 'package:flutter/material.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: NDeviceUtils.getAppBarHeight(),
      child: TextButton(onPressed: () {}, child: const Text('تخطي')),
    );
  }
}
