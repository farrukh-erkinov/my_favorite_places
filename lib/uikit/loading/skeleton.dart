import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';

/// {@template skeleton.class}
/// Виджет-скелетон.
/// {@endtemplate}
class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final double? radius;
  final BorderRadius? borderRadius;

  /// {@macro skeleton.class}
  const Skeleton({super.key, this.width, this.height, this.background, this.radius, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(color: background ?? colorTheme.surface, borderRadius: borderRadius),
      ),
    );
  }
}
