import 'package:flutter/material.dart';
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
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: NAppTheme.lightTheme,
    );
  }
}
