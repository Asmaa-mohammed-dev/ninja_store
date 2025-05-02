import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/terms_conditions_checkbox.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/validators/validation.dart';

class NSignUpForm extends StatelessWidget {
  const NSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('الاسم الأول', value),
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
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('الاسم الأخير', value),
                  controller: controller.lastName,
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
            controller: controller.username,
            validator:
                (value) => TValidator.validateEmptyText('اسم المستخدم', value),
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
            controller: controller.email,
            expands: false,
            validator: (value) => TValidator.validateEmail(value),
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
            controller: controller.phoneNumber,
            expands: false,
            validator: (value) => TValidator.validatePhoneNumber(value),
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
            controller: controller.password,
            obscureText: true,
            validator: (value) => TValidator.validatePassword(value),
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
              onPressed: () => controller.signup(),
            ),
          ),
        ],
      ),
    );
  }
}
