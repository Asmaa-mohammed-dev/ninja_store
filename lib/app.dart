import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ninja_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ninja_store/utils/theme/theme.dart';

//To do : Add widgets bindings
//To do : Init Local Storage
//To do : Await Native Splash
//To do : Initialize firebase
//To do : Initialize authentication

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: NAppTheme.lightTheme,
        home: const OnBoardingScreen(),
        //  textDirection: TextDirection.rtl,
      ),
    );
  }
}
