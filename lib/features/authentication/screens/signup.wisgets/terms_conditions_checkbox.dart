import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NTermsAndConditionCheckbox extends StatelessWidget {
  const NTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged:
                  (value) =>
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value,
            ),
          ),
        ),
        SizedBox(height: NSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: NTexts.isAgreeTo,
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
