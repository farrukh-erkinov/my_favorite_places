/// Размеры индикатора загрузки.
enum AppLoaderSizes {
  /// Большой.
  large(strokeWidth: _strokeWidthLarge, size: _sizeLarge),

  /// Средний.
  medium(strokeWidth: _strokeWidthMedium, size: _sizeMedium),

  /// Маленький.
  small(strokeWidth: _strokeWidthSmall, size: _sizeSmall);

  /// Толщина линии.
  final double strokeWidth;

  /// Размер.
  final double size;

  const AppLoaderSizes({required this.strokeWidth, required this.size});
}

const _strokeWidthLarge = 4.0;
const _sizeLarge = 40.0;
const _strokeWidthMedium = 2.67;
const _sizeMedium = 26.67;
const _strokeWidthSmall = 1.67;
const _sizeSmall = 16.67;
