// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0XFF002660);
  static const Color darkColor = Color(0XFF090909);
  static const Color darkGreyColor = Color(0XFF424242);
  static const Color greyColor = Color(0XFF616161);
  static const Color lightGreyColor = Color(0XFFBDBDBD);
  static const Color greenColor = Color(0XFF28A745);
  static const Color redColor = Color(0XFFDC3545);
  static const Color inProgressColor = Color(0XFF527CBA);
  static const Color buttonActiveColor = Color(0XFF002660);
  static const Color defaultButtonColor = Color(0xFFD9DEE7);
  static const Color hoverButtonColor = Color(0xFF002256);
  static const LinearGradient gradientColor = LinearGradient(
    colors: [Color(0xFF002660), Color(0xFF00509E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color whiteLightColor = Color(0XFFCCD4DF);
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color backgroundColor = Color(0XFFF8F9FE);
  static const Color textLightColor = Color(0XFFA0A0A0);
  static const Color dividerColor = Color(0XFFD8D8D8);
  static const Color pendingColor = Color(0XFFBDB525);

  //opacityColor
  static Color get opacityPrimaryColor =>
      const Color(0XFF002660).withOpacity(0.06);
  static Color get opacitySecondColor =>
      const Color(0XFF002660).withOpacity(0.12);
  static Color get opacityGreenColor =>
      const Color(0XFF43CB65).withOpacity(0.12);
  static Color get opacityRedColor => const Color(0XFFE62430).withOpacity(0.12);
}
