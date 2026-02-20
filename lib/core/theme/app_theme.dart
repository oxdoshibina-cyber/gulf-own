// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart'; // ✅ For kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      // ✅ Safe check: only apply Android overlay style when not running on web
      systemOverlayStyle: !kIsWeb
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            )
          : const SystemUiOverlayStyle(
              // Web safe fallback
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
      fillColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    disabledColor: Colors.white,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
  );
}
