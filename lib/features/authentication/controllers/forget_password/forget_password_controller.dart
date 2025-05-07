import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  //  Variables
  final email = TextEditingController();
  GlobalKey<FormState> ForgetPasswordFormKey = GlobalKey<FormState>();
  //  Send reset password email
  sendPasswordResetEmail() async {
    try {
      //  Start loading
      NFullScreenLoader.openLoadingDialog(
        'جار تحميل البيانات  .......',
        NImages.docerAnimation,
      );

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Form Validation
      if (!ForgetPasswordFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      ///Remove Loader
      NFullScreenLoader.stopLoading();

      ///Show Succes Screen
      NLoaders.successSnackBar(
        title: 'تم ارسال البريد الإلكتروني',
        message: 'تم ارسال رابط للبريد الإلكتروني لإعادة كلمة المرور'.tr,
      );

      ///Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      ///Remove Loader
      NFullScreenLoader.stopLoading();
      NLoaders.errorSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //  Start loading
      NFullScreenLoader.openLoadingDialog(
        'جار تحميل البيانات  .......',
        NImages.docerAnimation,
      );

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      ///Remove Loader
      NFullScreenLoader.stopLoading();

      ///Show Succes Screen
      NLoaders.successSnackBar(
        title: 'تم ارسال البريد الإلكتروني',
        message: 'تم ارسال رابط للبريد الإلكتروني لإعادة كلمة المرور'.tr,
      );
    } catch (e) {
      ///Remove Loader
      NFullScreenLoader.stopLoading();
      NLoaders.errorSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }
}
