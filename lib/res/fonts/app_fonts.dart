import 'package:flutter/material.dart';

//App Font
class AppFonts {
  static const String openSansBold = 'OpenSans-Bold';
  static const String openSansLight = 'OpenSans-ExtraBold';
  static const String openSansMedium = 'OpenSans-Medium';
  static const String openSansRegular = 'OpenSans-Regular';
  static const String openSansSemiBold = 'OpenSans-SemiBold';

  static TextStyle openSansBold900(double fontSize, Color color) => TextStyle(
        fontFamily: openSansBold,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w900,
      );
  static TextStyle openSansBold700(double fontSize, Color color) => TextStyle(
        fontFamily: openSansMedium,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
      );
  static TextStyle openSansMedium500(double fontSize, Color color) => TextStyle(
        fontFamily: openSansMedium,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      );
  static TextStyle regular(double fontSize, Color color) => TextStyle(
        fontFamily: openSansRegular,
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      );
}
