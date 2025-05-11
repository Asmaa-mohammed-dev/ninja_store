import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/personalization/controllers/user_controller.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('إعادة التحقق من المستخدم')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(NSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: InputDecoration(
                      prefixIcon: Transform.rotate(
                        angle: 3.14 / 2, // الزاوية بالراديان (90 درجة)
                        child: Icon(Iconsax.direct_right),
                      ),
                      labelText: NTexts.email,
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),

                  ///Password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: NTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed:
                              () =>
                                  controller.hidePassword.value =
                                      !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwSections),

                  ///Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          () => controller.reAuthenticateEmailAndPassword(),
                      child: const Text('تأكيد'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
