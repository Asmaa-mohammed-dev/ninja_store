import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.model.dart';
import 'package:ninja_store/data/repositories_authentication/user/user.repository.dart';
import 'package:ninja_store/features/authentication/screens/login/login.dart';
import 'package:ninja_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/sizes.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        ///Convert Name to first and last name
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? '',
        );
        final username = UserModel.generateUsername(
          userCredentials.user!.displayName ?? '',
        );

        ///Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        ///Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      NLoaders.warningSnackBar(
        title: 'لم يتم حفظ البيانات',
        message:
            'حدث خطأ ما أثناء حفظ بياناتك. بإمكانك إعادة حفظ بياناتك في ملفك الشخصي',
      );
    }
  }

  //Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: Get.width * 0.8, // العرض بنسبة 80% من الشاشة
          padding: const EdgeInsets.all(NSizes.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'حذف الحساب',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: NSizes.spaceBtwSections),
              const Text(
                'هل أنت متأكد من حذف حسابك نهائيًا؟ هذا الإجراء غير قابل للتراجع، وستتم إزالة جميع بياناتك بشكل نهائي.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: NSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: Get.width * 0.35,
                    height: Get.height * 0.10,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(Get.overlayContext!).pop(),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'إلغاء',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  SizedBox(
                    width: Get.width * 0.35,
                    height: Get.height * 0.10,
                    child: ElevatedButton(
                      onPressed: () async => deleteUserAccount(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('حذف'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void deleteAccountWarningPopup() {
  //   Get.defaultDialog(
  //     contentPadding: const EdgeInsets.all(NSizes.md),
  //     title: 'حذف الحساب',
  //     middleText:
  //         'هل أنت متأكد من حذف حسابك نهائيًا؟هذا الإجراء غير قابل للتراجع، وستتم إزالة جميع بياناتك بشكل نهائي. ',
  //     confirm: ElevatedButton(
  //       onPressed: () async => deleteUserAccount(),

  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.red,
  //         side: const BorderSide(color: Colors.red),
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: NSizes.lg),
  //         child: Text('حذف'),
  //       ),
  //     ),
  //     cancel: OutlinedButton(
  //       onPressed: () => Navigator.of(Get.overlayContext!).pop(),
  //       child: const Text('الغاء'),
  //     ),
  //   );
  // }

  //Delete User Account
  void deleteUserAccount() async {
    try {
      NFullScreenLoader.openLoadingDialog(
        'جارٍ التحميل',
        NImages.docerAnimation,
      );
      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          NFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          NFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      NFullScreenLoader.stopLoading();
      NLoaders.warningSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }

  //Re - Authenticate before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      NFullScreenLoader.openLoadingDialog(
        'جارٍ التحميل',
        NImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        NFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();
      NFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      NFullScreenLoader.stopLoading();
      NLoaders.warningSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }
}
