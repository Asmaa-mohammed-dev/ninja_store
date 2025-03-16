import 'package:flutter/material.dart';
import 'package:ninja_store/common/styles/spacing_styles.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: NSpacingStyle.paddingAppBarHeight,
          child: Column(
            children: [
              ///Image
              Image(image: AssetImage(image)),
              SizedBox(height: NSizes.spaceBtwSections),

              ///Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwItems - 15),

              SizedBox(height: NSizes.spaceBtwSections - 15),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwSections - 15),
              MyButton(
                colors: NColors.primary,
                title: NTexts.tContinue,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
