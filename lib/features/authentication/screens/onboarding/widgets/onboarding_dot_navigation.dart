import 'package:flutter/material.dart';
import 'package:ninja_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  final PageController pageController;

  const OnboardingDotNavigation({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Positioned(
        bottom: NDeviceUtils.getBottomNavigationBarHeight(context) + 5,
        right: NSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotHeight: 6,
          ),
        ),
      ),
    );
  }
}
