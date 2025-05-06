import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninja_store/data/repositories.authentication/authentication/n_firebase_auth_exception.dart';
import 'package:ninja_store/features/authentication/screens/login/login.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Varaibles

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
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

  /* ---------------- Email & Password --------------------*/
  // Email Authentication Sign in

  //  Email Authentication Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw NFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    } catch (e) {
      throw 'يوجد خطأ قد حدث، حاول مرة أخرى';
    }
  }

  //  ReAuthentication User

  //  Email Vertification

  //  Email Forget Password

  /* ---------------- [Federated identity & social sign in] --------------------*/
  // Google Authentication google

  //Facebook Authentication

  /* ---------------- [end federated identity & social sign-in] --------------------*/

  // LogoutUser- Valid for any authentication

  //Delete user - Remove user Auth and Firestore Account
}
