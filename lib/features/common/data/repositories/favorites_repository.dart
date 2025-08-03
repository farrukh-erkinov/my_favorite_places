import 'package:flutter/foundation.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';

/// {@template favorites_repository.class}
/// Implementation of [IFavoritesRepository] для хранения избранного в ОЗУ.
/// {@endtemplate}
final class FavoritesRepository implements IFavoritesRepository {
  final _favoritesListenable = ValueNotifier<List<PlaceEntity>>([]);

  /// {@macro favorites_repository.class}
  FavoritesRepository();

  @override
  ValueListenable<List<PlaceEntity>> get favoritesListenable => _favoritesListenable;

  @override
  Future<void> fetchFavorites() async {
    // В ОЗУ версии просто возвращаем текущий список
    // Здесь можно добавить имитацию задержки загрузки
  }

  @override
  void dispose() {
    _favoritesListenable.dispose();
  }

  @override
  void toggleFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    final index = favorites.indexWhere((element) => element.name == place.name);

    if (index == -1) {
      // Добавляем в избранное
      _favoritesListenable.value = [...favorites, place];
    } else {
      // Удаляем из избранного
      final newFavorites = [...favorites]..removeAt(index);
      _favoritesListenable.value = newFavorites;
    }
  }

  @override
  void removeFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    final newFavorites = favorites.where((element) => element.name != place.name).toList();
    _favoritesListenable.value = newFavorites;
  }

  @override
  bool isFavorite(PlaceEntity place) {
    final favorites = _favoritesListenable.value;
    return favorites.any((element) => element.name == place.name);
  }
}
