import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NTermsAndConditionCheckbox extends StatelessWidget {
  const NTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        SizedBox(height: NSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${NTexts.isAgreeTo}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: '${NTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: NColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: '${NTexts.and} ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: '${NTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: NColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
