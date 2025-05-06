import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories.authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/data/repositories.authentication/user/user.model.dart';
import 'package:ninja_store/data/repositories.authentication/user/user.repository.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/verify_email.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup

  void signup() async {
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
        NLoaders.errorSnackBar(
          title: 'خطأ في الاتصال',
          message: 'يرجى التحقق من اتصال الإنترنت ثم المحاولة مرة أخرى.',
        );
        return;
      }

      ///Form Validation
      if (!signupFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        NLoaders.warningSnackBar(
          title: 'قم بالموافقة على الشروط والأحكام',
          message:
              'من أجل إنشاء حساب، يجب عليك قراءة والموافقة على الشروط والأحكام',
        );
        return;
      }

      ///Register user in the Firebase Authentication & Save user data in the firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      ///save Authenticated user data in the firebase Firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);

      NFullScreenLoader.stopLoading();

      ///Show Success Message
      NLoaders.successSnackBar(
        title: 'تهانينا',
        message: 'تم انشاء حسابك بنجاح! قم بتأكيد ايميلك للمتابعة',
      );

      ///Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      ///Show soome Generic Error to the user
      NFullScreenLoader.stopLoading();

      NLoaders.errorSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }
}
