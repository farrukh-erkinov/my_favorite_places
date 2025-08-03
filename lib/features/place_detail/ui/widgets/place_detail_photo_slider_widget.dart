import 'package:flutter/material.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';

/// Виджет слайдера с фотографиями места.
class PlaceDetailPhotoSliderWidget extends StatelessWidget {
  /// Список ссылок на фотографии.
  final List<String> images;

  /// Обработчик нажатия на кнопку "назад".
  final VoidCallback onBackPressed;

  const PlaceDetailPhotoSliderWidget({required this.images, required this.onBackPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final topPositionBackButton = MediaQuery.paddingOf(context).top + 16;

    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade300),
                  );
                },
              ),
              Positioned(
                left: 16,
                top: topPositionBackButton,
                child: CircleAvatar(
                  backgroundColor: colorTheme.scaffold,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: colorTheme.textSecondary),
                    onPressed: onBackPressed,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
