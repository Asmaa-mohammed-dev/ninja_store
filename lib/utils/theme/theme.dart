import 'package:flutter/material.dart';
import 'package:ninja_store/utils/theme/custom_themes/appbar_Theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ninja_store/utils/theme/custom_themes/text_theme.dart';

class NAppTheme {
  NAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Adobe',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: NTextTheme.lightTextTheme,
    chipTheme: NChipTheme.lightChipTheme,
    appBarTheme: NAppBarTheme.lightAppbBarTheme,
    checkboxTheme: NCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.lightInputDecorationTheme,
  );
}
