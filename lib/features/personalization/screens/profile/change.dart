import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/features/personalization/controllers/update_name_controller.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //Custom AppBar
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'تغير الاسم',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
              color: NColors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Headings
              Text(
                'استخدم اسمك الحقيقي من أجل تسهيل التحقق، اسمك سيظهر على عدة صفحات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 21,
                  color: NColors.black,
                ),
              ),
              const SizedBox(height: NSizes.spaceBtwSections),
              //Text Field and button
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: NTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: NSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: NTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: NSizes.spaceBtwSections),
              //Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('حفظ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
