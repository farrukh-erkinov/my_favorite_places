// ignore_for_file: member-ordering

import 'package:flutter/material.dart';

/// {@template app_colors.class}
/// Цвета приложения.
/// {@endtemplate}
abstract class AppColors {
  /// Цвета и названия из макета фигмы.
  static const colorWhite = Colors.white;
  static const colorBackground = Color(0xffF5F5F5);
  static const colorSecondary = Color(0xff3B3E5B);
  static const colorSecondary2 = Color(0xff7C7E92);
  static const colorInactiveBlack = Color.fromRGBO(124, 126, 146, 0.56);
  static const colorPicker = Color(0xFF8CC152);

  static const colorWhiteGreen = Color(0xff4CAF50);
  static const colorWhiteGreen2 = Color(0xff68B74E); // сплэш экран градиент
  static const colorWhiteYellow = Color(0xffFCDD3D);
  static const colorWhiteYellow2 = Color(0xffB8CC45); // сплэш экран градиент
  static const colorWhiteError = Color(0xffEF4343);
  static const colorWhiteMain = Color(0xff252849);

  static const colorBlackGreen = Color(0xff6ADA6F);
  static const colorBlackGreen2 = Color(0xff6CB84D); // сплэш экран градиент
  static const colorBlackYellow = Color(0xffFFE769);
  static const colorBlackYellow2 = Color(0xffBBCD45); // сплэш экран градиент
  static const colorBlackError = Color(0xffCF2A2A);
  static const colorBlackDark = Color(0xff1A1A20);
  static const colorBlackMain = Color(0xff21222C);
}
