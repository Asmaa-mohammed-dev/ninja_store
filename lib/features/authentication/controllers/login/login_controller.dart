import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/utils/constants/image_strings.dart';
import 'package:ninja_store/utils/internet/network_manager.dart';
import 'package:ninja_store/utils/popups/full_screen_loader.dart';
import 'package:ninja_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  ///Varaibles
  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      ///Start Loading
      NFullScreenLoader.openLoadingDialog(
        'تسجيل الدخول...',
        NImages.docerAnimation,
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
      if (!loginFormKey.currentState!.validate()) {
        NFullScreenLoader.stopLoading();
        return;
      }

      ///Save data
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      ///login user in the Firebase Authentication
      final UserCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ///Remove loader

      NFullScreenLoader.stopLoading();

      ///Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      NFullScreenLoader.stopLoading();
      NLoaders.errorSnackBar(title: 'حدث خطأ', message: e.toString());
    }
  }
}
