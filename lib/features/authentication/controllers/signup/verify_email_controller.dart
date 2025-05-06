import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/features/authentication/screens/login/widgets/success_screen/sucess_screen.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email Whenever Verify Screen apperas & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVertification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification link
  sendEmailVertification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVertification();
      NLoaders.successSnackBar(
        title: 'تم ارسال الايميل',
        message: 'برجاء التأكد من الرسائل الواردة وقمت بتأكيد بريدك الإلكتروني',
      );
    } catch (e) {
      NLoaders.errorSnackBar(title: 'حدث خطأ!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on Email Vertification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SucessScreen(
            image: NImages.successfullyRegisterAnimation,
            title: NTexts.yourAccountCreatedTitle,
            subTitle: NTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually Check if Email Verified
  checkEmailVertificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SucessScreen(
          image: NImages.successfullyRegisterAnimation,
          title: NTexts.yourAccountCreatedTitle,
          subTitle: NTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
