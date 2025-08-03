import 'package:surf_places/api/service/api_client.dart';
import 'package:surf_places/core/data/repositories/base_repository.dart';
import 'package:surf_places/core/domain/entities/result/request_operation.dart';
import 'package:surf_places/features/common/data/converters/place_converter.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/places/domain/reposiotries/i_places_repository.dart';

/// Реализация [IPlacesRepository].
final class PlacesRepository extends BaseRepository implements IPlacesRepository {
  final ApiClient _apiClient;
  final IPlaceDtoToEntityConverter _placeDtoToEntityConverter;

  PlacesRepository({required ApiClient apiClient, required IPlaceDtoToEntityConverter placeDtoToEntityConverter})
    : _apiClient = apiClient,
      _placeDtoToEntityConverter = placeDtoToEntityConverter;

  @override
  RequestOperation<List<PlaceEntity>> getPlaces() {
    return makeApiCall<List<PlaceEntity>>(() async {
      final placesDtos = await _apiClient.getPlaces();

      // for (final dto in placesDtos) {
      //  final firstUrl = dto.images.isNotEmpty ? dto.images.first : '—';
      //  print('🔗 First image = $firstUrl');
      // }
      //print('length of places ${placesDtos.length}');

      final placesEntities = _placeDtoToEntityConverter.convertMultiple(placesDtos).toList();
      return placesEntities;
    });
  }
}
