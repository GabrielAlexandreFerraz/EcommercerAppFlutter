import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const grayDarkColor = Color(0xFF131313);
  static const grayMediumColor = Color(0xFF464646);
  static const grayLightColor = Color(0xFFCCCCCC);
  static const brownColor = Color(0xFF1D1617);
  static const greenColor = Color(0xFF182222);

  static List<Color> get primaryWhiteAndBlack => [whiteColor, blackColor];
  static List<Color> get primaryGrayAndWhite => [whiteColor, grayMediumColor];
  static List<Color> get primaryGrayAndGray => [grayDarkColor, grayLightColor];
}
