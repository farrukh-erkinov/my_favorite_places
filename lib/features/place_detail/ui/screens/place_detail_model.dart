import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';

/// Модель для экрана детальной информации о месте.
class PlaceDetailModel implements IPlaceDetailModel {
  final IFavoritesRepository _favoritesRepository;
  final PlaceEntity _placeEntity;

  PlaceDetailModel({required PlaceEntity placeEntity, required IFavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository,
      _placeEntity = placeEntity;

  @override
  PlaceEntity get placeEntity => _placeEntity;

  @override
  bool toggleFavorite() {
    _favoritesRepository.toggleFavorite(_placeEntity);
    return isFavorite();
  }

  @override
  bool isFavorite() {
    return _favoritesRepository.isFavorite(_placeEntity);
  }
}

/// Интерфейс модели для экрана детальной информации о месте.
abstract class IPlaceDetailModel {
  /// Место.
  PlaceEntity get placeEntity;

  /// Переключает значение лайка на месте.
  ///
  /// Возвращает итоговое значение.
  bool toggleFavorite();

  /// Проверяет, добавлено ли место в избранное.
  bool isFavorite();
}
