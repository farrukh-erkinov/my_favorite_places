import 'package:flutter/painting.dart';

const _fontFamily = 'Roboto';

/// Стили текстов на основе фигмы.
enum AppTextStyle {
  largeTitle(TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.125, fontFamily: _fontFamily)),
  title(TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1.2, fontFamily: _fontFamily)),
  subtitle(TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.33, fontFamily: _fontFamily)),
  textMedium(TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.25, fontFamily: _fontFamily)),
  text(TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.25, fontFamily: _fontFamily)),
  smallBold(TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.29, fontFamily: _fontFamily)),
  small(TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.29, fontFamily: _fontFamily)),
  superSmallMedium(TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.33, fontFamily: _fontFamily)),
  superSmall(TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.33, fontFamily: _fontFamily)),
  button(
    TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.3, height: 1.29, fontFamily: _fontFamily),
  );

  /// Text style value.
  final TextStyle value;

  const AppTextStyle(this.value);
}
