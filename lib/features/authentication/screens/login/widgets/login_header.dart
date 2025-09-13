import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NLoginHeader extends StatelessWidget {
  const NLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 130, width: 170, image: AssetImage(NImages.appLogo)),
        Text(
          NTexts.loginSubTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
