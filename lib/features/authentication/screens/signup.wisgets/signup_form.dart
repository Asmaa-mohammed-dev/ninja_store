import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/terms_conditions_checkbox.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/verify_email.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NSignUpForm extends StatelessWidget {
  const NSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: NTexts.firstName,
                    hintText: NTexts.firstName,
                    labelStyle: TextStyle(fontSize: 20),
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: NSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: NTexts.lastName,
                    hintText: NTexts.lastName,
                    labelStyle: TextStyle(fontSize: 20),
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.username,
              hintText: NTexts.username,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.email,
              hintText: NTexts.email,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Phone Number
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.phoneNo,
              hintText: NTexts.phoneNo,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: NTexts.password,
              hintText: NTexts.password,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: NSizes.spaceBtwInputFields),

          ///Terms & conditions
          const NTermsAndConditionCheckbox(),
          const SizedBox(height: NSizes.spaceBtwInputFields),

          ///SignUp button
          SizedBox(
            width: double.infinity,
            child: MyButton(
              colors: NColors.primary,
              title: NTexts.createAccount,
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
