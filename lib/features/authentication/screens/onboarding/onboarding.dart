import 'package:flutter/material.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
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
          //Circular Button
        ],
      ),
    );
  }
}
