import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';

class AppTextStyle {
  /// MEDIUM TITLE (16sp)
  static TextStyle kTitleMediumTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 16.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.darkColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0,
      );

  /// PAGE HEADING (14sp)
  static TextStyle kPageHeadingTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.greyColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: 1.0,
        letterSpacing: 0,
      );

  /// LARGE TITLE (24sp)
  static TextStyle kLargeTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 24.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.darkColor,
        fontWeight: fontWeight ?? FontWeight.w700,
        height: 1.0,
        letterSpacing: 0,
      );

  /// SMALL TITLE (12–14sp) → for labels like (Brand, Model, Technician)
  static TextStyle kTitleSmallTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 13.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.textLightColor,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0,
      );

  /// MICRO TEXT (10–12sp)
  static TextStyle kSmallTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 12.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.greyColor,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: 0,
      );

  /// BUTTON TEXT (Medium, White)
  static TextStyle kButtonTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 15.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.whiteColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: 0,
      );

  /// STATUS BADGE TEXT (Assigned / Pending)
  static TextStyle kStatusTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.greenColor,
        fontWeight: fontWeight ?? FontWeight.w600,
      );

  /// AMOUNT TEXT (₹877) – big and bold
  static TextStyle kAmountTextStyle({
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 22.sp,
        fontFamily: 'Poppins',
        color: fontColor ?? AppColors.greenColor,
        fontWeight: fontWeight ?? FontWeight.w700,
        letterSpacing: 0,
      );
}

