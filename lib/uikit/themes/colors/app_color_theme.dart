// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/colors/app_colors.dart';

/// {@template app_color_theme.class}
/// App brand color scheme.
///
/// This extension is in sync with base [ThemeData] and [ColorScheme].
///
/// Use case:
///
/// ```dart
/// final colorScheme = CyberdomColorScheme.of(context);
///
/// return Container(color: colorScheme.primary);
/// ```
/// {@endtemplate}
@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  /// Returns [AppColorTheme] from [context].
  static AppColorTheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorTheme>() ?? _throwThemeNotFound(context);

  final Color accent;
  final Color background;
  final Color divider;
  final Color error;
  final Color icon;
  final Color inactive;
  final Color inactiveVariant;
  final Color neutralWhite;
  final Color scaffold;
  final Color secondary;
  final Color secondaryVariant;
  final Color surface;
  final Color textInactive;
  final Color textPrimary;
  final Color textSecondary;
  final Color textSecondaryVariant;

  const AppColorTheme._({
    required this.scaffold,
    required this.background,
    required this.surface,
    required this.accent,
    required this.error,
    required this.inactive,
    required this.inactiveVariant,
    required this.secondary,
    required this.secondaryVariant,
    required this.divider,
    required this.icon,
    required this.neutralWhite,
    required this.textPrimary,
    required this.textSecondary,
    required this.textSecondaryVariant,
    required this.textInactive,
  });

  /// Base dark theme version.
  const AppColorTheme.dark()
    : scaffold = AppColors.colorBlackMain,
      background = AppColors.colorBackground,
      surface = AppColors.colorBlackDark,
      accent = AppColors.colorBlackGreen,
      error = AppColors.colorBlackError,
      inactive = AppColors.colorInactiveBlack,
      inactiveVariant = AppColors.colorBlackDark,
      secondary = AppColors.colorSecondary,
      secondaryVariant = AppColors.colorSecondary2,
      divider = AppColors.colorInactiveBlack,
      icon = AppColors.colorWhite,
      neutralWhite = AppColors.colorWhite,
      textPrimary = AppColors.colorWhite,
      textSecondary = AppColors.colorWhite,
      textSecondaryVariant = AppColors.colorSecondary2,
      textInactive = AppColors.colorInactiveBlack;

  /// Base light theme version.
  const AppColorTheme.light()
    : scaffold = AppColors.colorWhite,
      background = AppColors.colorBackground,
      surface = AppColors.colorBackground,
      accent = AppColors.colorWhiteGreen,
      error = AppColors.colorWhiteError,
      inactive = AppColors.colorInactiveBlack,
      inactiveVariant = AppColors.colorBackground,
      secondary = AppColors.colorSecondary,
      secondaryVariant = AppColors.colorSecondary2,
      divider = AppColors.colorInactiveBlack,
      icon = AppColors.colorWhite,
      neutralWhite = AppColors.colorWhite,
      textPrimary = AppColors.colorWhiteMain,
      textSecondary = AppColors.colorSecondary,
      textSecondaryVariant = AppColors.colorSecondary2,
      textInactive = AppColors.colorInactiveBlack;

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? scaffold,
    Color? background,
    Color? surface,
    Color? accent,
    Color? error,
    Color? inactive,
    Color? inactiveVariant,
    Color? secondary,
    Color? secondaryVariant,
    Color? divider,
    Color? icon,
    Color? neutralWhite,
    Color? textPrimary,
    Color? textSecondary,
    Color? textSecondaryVariant,
    Color? textInactive,
  }) {
    return AppColorTheme._(
      scaffold: scaffold ?? this.scaffold,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      accent: accent ?? this.accent,
      error: error ?? this.error,
      inactive: inactive ?? this.inactive,
      inactiveVariant: inactiveVariant ?? this.inactiveVariant,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
      divider: divider ?? this.divider,
      icon: icon ?? this.icon,
      neutralWhite: neutralWhite ?? this.neutralWhite,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textSecondaryVariant: textSecondaryVariant ?? this.textSecondaryVariant,
      textInactive: textInactive ?? this.textInactive,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) {
      return this;
    }

    return AppColorTheme._(
      scaffold: Color.lerp(scaffold, other.scaffold, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      error: Color.lerp(error, other.error, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      inactiveVariant: Color.lerp(inactiveVariant, other.inactiveVariant, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant: Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      neutralWhite: Color.lerp(neutralWhite, other.neutralWhite, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textSecondaryVariant: Color.lerp(textSecondaryVariant, other.textSecondaryVariant, t)!,
      textInactive: Color.lerp(textInactive, other.textInactive, t)!,
    );
  }
}

Never _throwThemeNotFound(BuildContext context) => throw Exception('$AppColorTheme not found in $context');
