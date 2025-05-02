import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variable
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup

  Future<void> signup() async {
    try {
      ///Start Loading
      NFullScreenLoader.openLoadingDialog(
        'جارٍ معالجة بياناتك',
        NImages.animation,
      );

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Form Validation
      if (!signupFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      ///Register user in the Firebase Authentication & Save user data in the firebase
      ///save Authenticated user data in the firebase Firestore
      ///Show Success Message
      ///Move to Verify Email Screen
      ///Move to Verify Email Screen
    } catch (e) {
      ///Show soome Generic Error to the user
      NLoaders.errorSnackBar(title: 'حدث خطأ', message: e.toString());
    } finally {
      ///Remove Loader
      NFullScreenLoader.stopLoading();
    }
  }
}
