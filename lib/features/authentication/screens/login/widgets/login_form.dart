import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/signup.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NLoginForm extends StatelessWidget {
  const NLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSizes.spaceBtwSections),
        child: Column(
          children: [
            ///email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_left),
                labelText: NTexts.email,
                hintText: NTexts.email,
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: NSizes.spaceBtwInputFields),

            ///password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: NTexts.password,
                hintText: NTexts.password,
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: NSizes.spaceBtwInputFields / 2),

            ///Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(
                      NTexts.rememberMe,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(
                    NTexts.forgetPassword,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],

              ///Forget password
            ),
            SizedBox(height: NSizes.spaceBtwSections),

            MyButton(
              colors: NColors.primary,
              title: NTexts.signIn,
              onPressed: () {},
            ),
            SizedBox(height: NSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              height: NSizes.appBarHeight + 10,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // التحكم في الانحناء
                  ),
                ),
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  NTexts.createAccount,
                  style: TextStyle(
                    fontSize: 24, // تغيير حجم الخط
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MAJALLA',
                    color: NColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
