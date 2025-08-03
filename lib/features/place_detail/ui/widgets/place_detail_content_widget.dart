import 'package:flutter/material.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// Виджет с контентом детальной информации о месте.
class PlaceDetailContentWidget extends StatelessWidget {
  /// Место.
  final PlaceEntity place;

  const PlaceDetailContentWidget({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(place.name, style: textTheme.title.copyWith(color: colorTheme.textSecondary)),
        const SizedBox(height: 2),
        Text(place.placeType.name.toLowerCase(), style: textTheme.smallBold.copyWith(color: colorTheme.textSecondary)),
        const SizedBox(height: 24),
        Text(place.description, style: textTheme.small.copyWith(color: colorTheme.textSecondary)),
      ],
    );
  }
}
