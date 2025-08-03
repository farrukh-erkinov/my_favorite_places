import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// {@template text_button_widget.class}
/// Текстовая кнопка.
/// {@endtemplate}
class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  /// {@macro text_button_widget.class}
  const TextButtonWidget({required this.title, required this.onPressed, this.color, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: color ?? colorTheme.accent,
          textStyle: textTheme.text,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        child: Text(title),
      ),
    );
  }
}
