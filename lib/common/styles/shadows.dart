import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NSadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: NColors.darkGrey.withAlpha(25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: NColors.darkGrey.withAlpha(25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
