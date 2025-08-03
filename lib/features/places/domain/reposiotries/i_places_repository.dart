import 'package:surf_places/core/domain/entities/result/request_operation.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';

/// Интерфейс репозитория для получения мест.
abstract interface class IPlacesRepository {
  /// Получить список мест.
  RequestOperation<List<PlaceEntity>> getPlaces();
}
