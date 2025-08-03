import 'package:flutter/material.dart';
import 'package:surf_places/uikit/loading/app_loader_sizes.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';

/// Основной виджет для круглого индикатора загрузки.
class AppLoader extends StatelessWidget {
  /// Размер.
  final AppLoaderSizes size;

  /// Цвет индикатора.
  final Color? color;

  /// Фон индикатора.
  final Color? backgroundColor;

  /// Флаг для полноэкранного лоадера.
  final bool isForScreen;

  /// {@template app_loader.class}
  /// Создать экземпляр [AppLoader].
  /// {@endtemplate}
  const AppLoader._({required this.size, this.color, this.backgroundColor, this.isForScreen = false});

  /// Фабрика для лоадера.
  factory AppLoader.create({required AppLoaderSizes size, Color? color, Color? backgroundColor, bool? isForScreen}) {
    return AppLoader._(size: size, color: color, backgroundColor: backgroundColor, isForScreen: isForScreen ?? false);
  }

  /// Фабрика для для полноэкранного лоадера.
  factory AppLoader.forScreen() {
    return const AppLoader._(size: AppLoaderSizes.large, isForScreen: true);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Center(
      child: SizedBox.square(
        dimension: size.size,
        child: CircularProgressIndicator(
          backgroundColor: isForScreen ? Colors.transparent : backgroundColor,
          color: color ?? colorTheme.accent,
          strokeWidth: size.strokeWidth,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
