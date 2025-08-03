import 'package:flutter/foundation.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';

/// Интерфейс для работы с избранными местами.
abstract interface class IFavoritesRepository {
  /// [ValueListenable] с локальным набором избранных карточек.
  ValueListenable<List<PlaceEntity>> get favoritesListenable;

  /// Получение избранных мест.
  Future<void> fetchFavorites();

  /// Освобождение ресурсов.
  void dispose();

  /// Переключение статуса избранного места.
  void toggleFavorite(PlaceEntity place);

  /// Удалить избранное место.
  void removeFavorite(PlaceEntity place);

  /// Проверить, является ли место избранным.
  bool isFavorite(PlaceEntity place);
}
