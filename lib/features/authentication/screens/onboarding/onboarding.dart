import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            reverse: true,
            children: [
              OnBoardingPage(
                image: NImages.onBoardingImage1,
                title: NTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: NImages.onBoardingImage2,
                title: NTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: NImages.onBoardingImage3,
                title: NTexts.onBoardingTitle3,
              ),
            ],
          ),
          //Skip button
          const OnBoardingSkip(),
          //Dot Navigation SmoothPageIndicator
          OnboardingDotNavigation(pageController: _pageController),
          //Circular Button
          onBoardingNextButton(),
        ],
      ),
    );
  }
}
