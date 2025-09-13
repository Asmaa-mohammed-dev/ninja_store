import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/features/personalization/screens/settings/settings.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/home.dart';
import 'package:ninja_store/features/shop/screens/store.dart';
import 'package:ninja_store/features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected:
                (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'الرئيسية',
              ),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'التسوق'),
              NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: 'المفضلة',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'الشخصية'),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavoritScreen(),
    const SettingsScreen(),
  ];
}
