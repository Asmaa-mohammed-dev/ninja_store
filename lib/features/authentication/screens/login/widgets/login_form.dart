import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/authentication/controllers/login/login_controller.dart';
import 'package:ninja_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/signup.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/validators/validation.dart';

class NLoginForm extends StatelessWidget {
  const NLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSizes.spaceBtwSections),
        child: Column(
          children: [
            ///email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_left),
                labelText: NTexts.email,
                hintText: NTexts.email,
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: NSizes.spaceBtwInputFields),

            ///password
            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                  labelText: NTexts.password,
                  hintText: NTexts.password,
                  labelStyle: TextStyle(fontSize: 20),
                  hintStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: NSizes.spaceBtwInputFields / 2),

            ///Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),
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
              onPressed: () => controller.emailAndPasswordSignIn(),
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
                onPressed: () => Get.to(() => SignupScreen()),
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
