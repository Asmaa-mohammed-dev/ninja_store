import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/images/n_circular_image.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/personalization/controllers/user_controller.dart';
import 'package:ninja_store/features/personalization/screens/profile/change.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

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
                    Obx(() {
                      final NetworkImage = controller.user.value.profilePicture;
                      final image =
                          NetworkImage.isNotEmpty ? NetworkImage : NImages.user;

                      return controller.imageUploading.value
                          ? const NShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                          : NCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: NetworkImage.isNotEmpty,
                          );
                    }),

                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
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
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              NProfileMenu(
                title: ' اسم المستخدم',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const Divider(),
              const NsectionHeading(
                title: 'معلومات الشخصية',
                showActionButton: false,
              ),
              const SizedBox(height: NSizes.spaceBtwItems),

              NProfileMenu(
                title: ' id',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              NProfileMenu(
                title: 'الايميل الالكتروني',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              NProfileMenu(
                title: ' رقم الهاتف',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              NProfileMenu(title: ' الجنس', value: 'أنثى', onPressed: () {}),
              NProfileMenu(
                title: 'تاريخ الميلاد',
                value: '10 اكتوبر 2001',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: NSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
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
