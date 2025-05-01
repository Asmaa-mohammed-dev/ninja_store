import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninja_store/features/authentication/screens/login/login.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Varaibles
  final deviceStorage = GetStorage();
  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('========Get Storage Auth repo========');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}


  
  
  /* ---------------- Email & Password --------------------*/
  // Email Authentication Sign in

  //  Email Authentication Register

  //  ReAuthentication User

  //  Email Vertification 

  //  Email Forget Password

  /* ---------------- [Federated identity & social sign in] --------------------*/
  // Google Authentication google

  //Facebook Authentication

  
  /* ---------------- [end federated identity & social sign-in] --------------------*/
  
  // LogoutUser- Valid for any authentication
  
  //Delete user - Remove user Auth and Firestore Account
