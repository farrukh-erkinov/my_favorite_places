import 'package:flutter/material.dart';
import 'package:surf_places/uikit/buttons/entity/button_state.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// Базовый виджет для кнопок с основным стилем.
class MainButton extends StatelessWidget {
  /// Состояние кнопки
  ///
  /// При состоянии, отличном от [ButtonState.active], не работает [onPressed].
  final ButtonState state;

  /// Колбек нажатия на кнопку.
  final VoidCallback onPressed;

  /// Контент кнопки.
  final Widget child;

  /// {@macro main_button.class}
  const MainButton({required this.onPressed, required this.child, this.state = ButtonState.active, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final textStyle = textTheme.button;
    final isLoading = state == ButtonState.loading;

    return FilledButton(
      onPressed: state == ButtonState.active ? onPressed : null,
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(textStyle),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return switch (state) {
            ButtonState.inactive => colorTheme.inactiveVariant,
            _ => colorTheme.accent,
          };
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return switch (state) {
            ButtonState.inactive => colorTheme.inactive,
            _ => colorTheme.neutralWhite,
          };
        }),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(48)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
        splashFactory: NoSplash.splashFactory,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Visibility(
            visible: !isLoading,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: child,
          ),
          if (isLoading) const Positioned(child: _Loader()),
        ],
      ),
    );
  }
}

/// Виджет загрузки для [MainButton].
class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(color: colorTheme.neutralWhite, strokeWidth: 2, strokeCap: StrokeCap.round),
      ),
    );
  }
}
