import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/my_button.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: AssetImage(NImages.deliveredEmailIllustration)),
              SizedBox(height: NSizes.spaceBtwSections),

              ///Title & SubTitle
              Text(
                NTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwItems - 15),

              SizedBox(height: NSizes.spaceBtwSections - 15),
              Text(
                NTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: NSizes.spaceBtwSections - 15),
              MyButton(
                colors: NColors.primary,
                title: NTexts.done,
                onPressed: () {},
              ),
              SizedBox(height: NSizes.spaceBtwSections - 15),

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
                  onPressed: () {},
                  child: const Text(
                    NTexts.resendEmail,
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
      ),
    );
  }
}
