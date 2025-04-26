import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'حسابي الشخصي',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              fontSize: 21,
              color: NColors.black,
            ),
          ),
        ),
        //Body
        body: SingleChildScrollView(
          padding: EdgeInsets.all(NSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    NCircularImage(image: NImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'تغيير صورة الحساب الشخصي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MAJALLA',
                          fontSize: 18,
                          color: NColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Divider
              const SizedBox(height: NSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
              const NsectionHeading(
                title: 'معلومات الحساب',
                showActionButton: false,
              ),
              const SizedBox(height: NSizes.spaceBtwItems),
              NProfileMenu(
                title: 'الاسم',
                value: 'مُبرمج بواسطة نينجا',
                onPressed: () {},
              ),
              NProfileMenu(
                title: ' اسم المستخدم',
                value: 'نينجا',
                onPressed: () {},
              ),

              const Divider(),

              const NsectionHeading(
                title: 'معلومات الشخصية',
                showActionButton: false,
              ),
              const SizedBox(height: NSizes.spaceBtwItems),

              NProfileMenu(title: ' id', value: '3232', onPressed: () {}),
              NProfileMenu(
                title: 'الايميل الالكتروني',
                value: 'ninja_store@gmail.com',
                onPressed: () {},
              ),
              NProfileMenu(
                title: ' رقم الهاتف',
                value: '+ 12342434',
                onPressed: () {},
              ),
              NProfileMenu(title: ' الجنس', value: 'ذكر', onPressed: () {}),
              NProfileMenu(
                title: 'تاريخ الميلاد',
                value: '10 اكتوبر 2001',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'اغلاق الحساب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 16,
                      color: Colors.red,
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
