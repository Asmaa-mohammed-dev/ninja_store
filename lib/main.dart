import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_store/app.dart';
import 'package:ninja_store/firebase_options.dart';
  // Entry point of flutter app
Future<void> main() async{

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Mehtod
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then(Firebase value) => Get.put(AuthenticationRepository()),
  // Todo: initialize Authentication
  // Load all The Material Design / Themes / Localization / Bindings
  runApp(const App());
}
