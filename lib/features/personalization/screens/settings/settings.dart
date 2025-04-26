import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/primary_header_container.dart';
import 'package:ninja_store/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:ninja_store/common/widgets/list_tile/user_profile.dart';
import 'package:ninja_store/common/widgets/texts/section_heading.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/profile.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  NAppBar(
                    title: Text(
                      'حسابي',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MAJALLA',
                        fontSize: 21,
                        color: NColors.white,
                      ),
                    ),
                  ),
                  NUserProfileTitle(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  SizedBox(height: NSizes.spaceBtwSections),
                ],
              ),
            ),
            //Body
            Padding(
              padding: EdgeInsets.all(NSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Settings
                  NsectionHeading(
                    title: 'إعدادات الحساب',
                    showActionButton: false,
                  ),

                  SizedBox(height: NSizes.spaceBtwItems),
                  NSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'العنوان',
                    subtitle: 'تحديد عنوان تسليم المشتريات',
                    onTap: () {},
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'حقيبة التسوق',
                    subtitle: ' أضف، أحذف منتجات وانتقل لعملية الدف',
                    onTap: () {},
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'طلباتي',
                    subtitle: 'في التقدم والأوردرات المكتملة',
                    onTap: () {},
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'الحساب البنكي',
                    subtitle: 'ألغي حسابك البنكي أو أدخل حساب جديد',
                    onTap: () {},
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'الاشعارات',
                    subtitle: 'قم بتحديد أي من رسائل الاشعارات',
                    onTap: () {},
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'خصوصية الحساب',
                    subtitle: 'قم بإدراة استخدام بياناتك وحساباتك المرتبطة',
                    onTap: () {},
                  ),

                  //App Settings
                  SizedBox(height: NSizes.spaceBtwSections),
                  NsectionHeading(
                    title: 'إعدادات التطبيق',
                    showActionButton: false,
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),
                  NSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'البيانات المحلية',
                    subtitle: "قم بتحميل الداتا على حسابك على فايربيز",
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'الموقع',
                    subtitle: "قم بتحديد مقترحات طبقًا لموقعك",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'الوضع الأمن',
                    subtitle: "قم بالبحث في وضع آمن لجميع الفئات العمرية",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'صور بجودة HD',
                    subtitle: "تحديد جودة الصورة لتصبح مرئية",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //Logout Button
                  SizedBox(height: NSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'الخروج',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: NColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
