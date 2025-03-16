import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Headings
              Text(
                NTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwItems),
              Text(
                NTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwItems),

              ///Text Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: NTexts.email,
                  labelStyle: TextStyle(fontSize: 20),
                  hintStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              SizedBox(height: NSizes.spaceBtwItems),

              ///Submit Button
              SizedBox(
                width: double.infinity,
                child: MyButton(
                  colors: NColors.primary,
                  title: NTexts.submit,
                  onPressed: () => Get.to(() => const ResetPassword()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
