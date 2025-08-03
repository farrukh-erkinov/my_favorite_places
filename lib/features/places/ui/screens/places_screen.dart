import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/places/domain/enitites/places_state.dart';
import 'package:surf_places/features/places/ui/screens/places_wm.dart';
import 'package:surf_places/features/places/ui/widgets/place_card_widget.dart';

/// Экран списка мест.
class PlacesScreen extends StatelessWidget {
  /// WM.
  final IPlacesWM wm;

  const PlacesScreen({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<PlacesState>(
        valueListenable: wm.placesStateListenable,
        builder: (context, places, _) {
          return NestedScrollView(
            headerSliverBuilder:
                (_, __) => [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.placesScreenAppBarTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: wm.searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Поиск',
                                    prefixIcon: const Icon(Icons.search),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: wm.clearSearch,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    isDense: true,
                                  ),
                                  onChanged: wm.onSearchQueryChanged,
                                ),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                icon: const Icon(Icons.filter_alt_outlined),
                                onPressed: wm.onFilterPressed,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            body: RefreshIndicator.adaptive(
              onRefresh: wm.loadPlaces,
              child: switch (places) {
                PlacesStateLoading() => const Center(child: CircularProgressIndicator()),
                PlacesStateFailure(:final failure) => Center(child: Text('${AppStrings.placesError}$failure')),
                PlacesStateData(:final places) when places.isEmpty => const Center(child: Text('Ничего не найдено.')),
                PlacesStateData(:final places) => ListView.separated(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final likedPlace = places[index];
                    return PlaceCardWidget(
                      place: likedPlace.place,
                      onCardTap: () => wm.onPlacePressed(context, likedPlace.place),
                      onLikeTap: () => wm.onLikePressed(likedPlace.place),
                      isFavorite: likedPlace.isFavorite,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
