import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// Тип карточки места.
enum PlaceCardType {
  /// Обычная карточка.
  place,

  /// Карточка в избранном.
  favorite,
}

/// Виджет карточки места.
class PlaceCardWidget extends StatelessWidget {
  /// Место.
  final PlaceEntity place;

  /// Обработчик нажатия на карточку.
  final VoidCallback onCardTap;

  /// Обработчик нажатия на кнопку "лайк".
  final VoidCallback onLikeTap;

  /// Тип карточки.
  final PlaceCardType cardType;

  /// Флаг, указывающий, добавлено ли место в избранное.
  final bool isFavorite;

  const PlaceCardWidget({
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    this.cardType = PlaceCardType.place,
    this.isFavorite = false,
    super.key,
  });

  static const _cardHeight = 188.0;
  static const _imageHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return SizedBox(
      height: _cardHeight,
      child: Material(
        color: colorTheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _imageHeight,
                      child: Image.network(
                        place.images.firstWhere((_) => true, orElse: () => ''),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Center(child: Text(AppStrings.noPhoto)),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.placeType.name.toLowerCase(),
                        style: textTheme.smallBold.copyWith(color: colorTheme.neutralWhite),
                      ),
                    ),
                  ],
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.text.copyWith(color: colorTheme.textSecondary),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: textTheme.small.copyWith(color: colorTheme.textSecondaryVariant),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(child: Material(type: MaterialType.transparency, child: InkWell(onTap: onCardTap))),
            Positioned(
              top: 8,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? colorTheme.error : colorTheme.neutralWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
