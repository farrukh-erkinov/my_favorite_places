import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:surf_places/features/places/domain/enitites/places_state.dart';
import 'package:surf_places/features/places/ui/screens/places_model.dart';

/// WM для экрана списка мест.
abstract class IPlacesWM {
  ValueListenable<PlacesState> get placesStateListenable;
  TextEditingController get searchController;
  void dispose();
  void onPlacePressed(BuildContext context, PlaceEntity place);
  void onLikePressed(PlaceEntity place);
  bool isFavorite(PlaceEntity place);
  Future<void> loadPlaces();
  void onSearchQueryChanged(String query);
  void clearSearch();
  void onFilterPressed();
}

class PlacesWM implements IPlacesWM {
  final IPlacesModel _model;
  final IFavoritesRepository _favoritesRepository;
  @override
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  PlacesWM(this._model, this._favoritesRepository) {
    _model.getPlaces();
  }

  @override
  ValueListenable<PlacesState> get placesStateListenable => _model.placesStateListenable;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    _model.dispose();
  }

  @override
  void clearSearch() {
    _debounce?.cancel();
    _model.filterPlaces('');
  }

  @override
  void onPlacePressed(BuildContext context, PlaceEntity place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetailScreenBuilder(place: place),
      ),
    );
  }

  @override
  void onLikePressed(PlaceEntity place) {
    _favoritesRepository.toggleFavorite(place);
  }

  @override
  bool isFavorite(PlaceEntity place) => _favoritesRepository.isFavorite(place);

  @override
  Future<void> loadPlaces() => _model.getPlaces();

  @override
  void onSearchQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _model.filterPlaces(query);
    });
  }

  @override
  void onFilterPressed() {
    // TODO: открыть экран фильтров
    debugPrint('Фильтр нажат');
  }
}
