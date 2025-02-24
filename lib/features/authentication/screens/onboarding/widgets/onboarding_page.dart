import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.image, required this.title});
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(NSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: NHelperFunctions.screenWidth() * 0.8,
            height: NHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontFamily: 'Arial'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
