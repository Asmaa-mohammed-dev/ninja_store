import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/n_firebase_auth_exception.dart';
import 'package:ninja_store/features/authentication/screens/login/login.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ninja_store/features/authentication/screens/signup.wisgets/verify_email.dart';
import 'package:ninja_store/navigation_menu.dart';

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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }

    // Local Storage
    // if (kDebugMode) {
    //   print('========Get Storage Auth repo========');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
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
  Future<void> sendEmailVertification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  //  Email Forget Password

  /* ---------------- [Federated identity & social sign in] --------------------*/
  // Google Authentication google

  //Facebook Authentication

  /* ---------------- [end federated identity & social sign-in] --------------------*/

  // LogoutUser- Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw NFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const NFormatException();
    } on PlatformException catch (e) {
      throw NPlatformException(e.code).message;
    } catch (e) {
      throw 'حدث خطأ، حاول مرة أخرى';
    }
  }

  //Delete user - Remove user Auth and Firestore Account
}
