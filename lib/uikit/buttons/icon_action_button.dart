import 'package:flutter/material.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';

/// {@template icon_action_button.class}
/// Кнопки действий для карточек поверх картинки.
/// {@endtemplate}
class IconActionButton extends StatelessWidget {
  final String svgPath;
  final double size;
  final Color color;
  final VoidCallback? onPressed;

  /// {@macro icon_action_button.class}
  const IconActionButton({required this.svgPath, required this.color, this.onPressed, this.size = 24, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(elevation: 0, padding: const EdgeInsets.all(4), shape: const CircleBorder()),
        child: SvgPictureWidget(svgPath, color: color, width: size, height: size),
      ),
    );
  }
}
