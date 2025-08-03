import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  static const _darkColorTheme = AppColorTheme.dark();
  static const _lightColorTheme = AppColorTheme.light();
  static final _textTheme = AppTextTheme.base();

  /// Dark theme configuration.
  static final darkTheme = ThemeData(
    extensions: [_darkColorTheme, _textTheme],
    brightness: Brightness.dark,
    primaryColor: _darkColorTheme.scaffold,
    scaffoldBackgroundColor: _darkColorTheme.scaffold,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorTheme.scaffold,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: _darkColorTheme.icon),
      titleTextStyle: _textTheme.subtitle.copyWith(color: _darkColorTheme.textPrimary),
    ),
    dividerTheme: DividerThemeData(color: _darkColorTheme.divider.withValues(alpha: 0.56), space: 1, thickness: 0.4),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: _darkColorTheme.accent,
      inactiveTrackColor: _darkColorTheme.inactive,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbColor: _darkColorTheme.neutralWhite,
      overlayShape: SliderComponentShape.noOverlay,
      tickMarkShape: SliderTickMarkShape.noTickMark,
      showValueIndicator: ShowValueIndicator.never,
      padding: EdgeInsets.zero,
    ),
  );

  /// Light theme configuration.
  static final lightTheme = ThemeData(
    extensions: [_lightColorTheme, _textTheme],
    brightness: Brightness.light,
    primaryColor: _lightColorTheme.neutralWhite,
    scaffoldBackgroundColor: _lightColorTheme.scaffold,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorTheme.scaffold,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: _lightColorTheme.icon),
      titleTextStyle: _textTheme.subtitle.copyWith(color: _lightColorTheme.textPrimary),
    ),
    dividerTheme: DividerThemeData(color: _lightColorTheme.divider.withValues(alpha: 0.56), space: 1, thickness: 0.4),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: _lightColorTheme.accent,
      inactiveTrackColor: _lightColorTheme.inactive,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbColor: _lightColorTheme.neutralWhite,
      overlayShape: SliderComponentShape.noOverlay,
      tickMarkShape: SliderTickMarkShape.noTickMark,
      showValueIndicator: ShowValueIndicator.never,
      padding: EdgeInsets.zero,
    ),
  );
}
