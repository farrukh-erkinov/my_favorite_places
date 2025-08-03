import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_wm.dart';
import 'package:surf_places/features/place_detail/ui/widgets/heart_animation_widget.dart';
import 'package:surf_places/features/place_detail/ui/widgets/place_detail_photo_slider_widget.dart';
import 'package:surf_places/uikit/buttons/main_button.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

/// Экран детальной информации о месте.
class PlaceDetailScreen extends StatelessWidget {
  /// WM.
  final IPlaceDetailWM wm;

  /// Место.
  final PlaceEntity place;

  const PlaceDetailScreen({required this.wm, required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 360,
                flexibleSpace: PlaceDetailPhotoSliderWidget(
                  images: wm.placeEntity.images,
                  onBackPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Text(place.name, style: textTheme.title.copyWith(color: colorTheme.textSecondary)),
                        const SizedBox(height: 2),
                        Text(
                          place.placeType.name.toLowerCase(),
                          style: textTheme.smallBold.copyWith(color: colorTheme.textSecondary),
                        ),
                        const SizedBox(height: 24),
                        Text(place.description, style: textTheme.small.copyWith(color: colorTheme.textSecondary)),
                        const SizedBox(height: 24),
                        MainButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.route, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                AppStrings.placeDetailsRouteButton,
                                style: textTheme.button.copyWith(color: colorTheme.neutralWhite),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(indent: 16, endIndent: 16),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                final shareText =
                                    '${place.name}\n${place.description}\n'
                                    'https://www.google.com/maps/search/?api=1&query=${place.lat},${place.lon}';
                                Share.share(shareText);
                              },
                              icon: const Icon(Icons.share),
                              color: colorTheme.textSecondary,
                              tooltip: AppStrings.placeDetailsShareButton,
                            ),
                            Builder(
                              builder: (context) {
                                final favoritesRepository = context.read<IFavoritesRepository>();
                                return ValueListenableBuilder<List<PlaceEntity>>(
                                  valueListenable: favoritesRepository.favoritesListenable,
                                  builder: (context, favorites, _) {
                                    final isFavorite = favorites.any((f) => f.name == place.name);
                                    return TextButton.icon(
                                      onPressed: wm.onLikePressed,
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? colorTheme.error : colorTheme.textSecondary,
                                      ),
                                      label: Text(
                                        isFavorite
                                            ? AppStrings.placeDetailsInFavoritesButton
                                            : AppStrings.placeDetailsFavoritesButton,
                                        style: textTheme.text.copyWith(color: colorTheme.textSecondary),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SafeArea(child: SizedBox.shrink()),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
          HeartAnimationWidget(key: wm.heartAnimationKey),
        ],
      ),
    );
  }
}
