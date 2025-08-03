import 'package:flutter/material.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';

/// {@template button_rounded.class}
/// Элемент интерфейса - небольшая закругленная квадратная или круглая кнопка с фиксированными размерами,
/// используется в поле поиска, как кнопка назад с детальной страницы, на карте.
/// {@endtemplate}
class ButtonRounded extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final double radius;
  final String icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final double? elevation;

  /// {@macro button_rounded.class}
  const ButtonRounded({
    required this.size,
    required this.backgroundColor,
    required this.radius,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size(size, size)),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
        ),
        child: SvgPictureWidget(icon, color: iconColor),
      ),
    );
  }
}
