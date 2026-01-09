import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninja_store/app.dart';
import 'package:ninja_store/data/repositories_authentication/authentication/authentication_repositories.dart';
import 'package:ninja_store/features/shop/controllers/firestore_uploader.dart';
import 'package:ninja_store/firebase_options.dart';
import 'package:ninja_store/navigation_menu.dart';

// Entry point of flutter app
Future<void> main() async {
  // Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Todo: Init Local Storage
  await GetStorage.init();

  // Todo: Init Payment Mehtod
  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize Firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  await FirestoreUploader.uploadProductsToFirestore();
  // Todo: initialize Authentication
  // Load all The Material Design / Themes / Localization / Bindings
    WidgetsFlutterBinding.ensureInitialized();
     Get.put(NavigationController());
  runApp(const App());
}
