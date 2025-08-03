import 'package:surf_places/api/data/place_type_dto.dart';
import 'package:surf_places/core/data/converter/converter.dart';
import 'package:surf_places/features/common/domain/enitities/place_type_entity.dart';

/// Конвертер из [PlaceTypeDto] в [PlaceTypeEntity].
typedef IPlaceTypeDtoToEntityConverter = Converter<PlaceTypeEntity, PlaceTypeDto>;

/// Реализация [IPlaceTypeDtoToEntityConverter].
final class PlaceTypeDtoToEntityConverter extends IPlaceTypeDtoToEntityConverter {
  const PlaceTypeDtoToEntityConverter();

  @override
  PlaceTypeEntity convert(PlaceTypeDto input) {
    return switch (input) {
      PlaceTypeDto.restaurant => PlaceTypeEntity.restaurant,
      PlaceTypeDto.cafe => PlaceTypeEntity.cafe,
      PlaceTypeDto.park => PlaceTypeEntity.park,
      PlaceTypeDto.museum => PlaceTypeEntity.museum,
      PlaceTypeDto.shopping => PlaceTypeEntity.shopping,
      PlaceTypeDto.other => PlaceTypeEntity.other,
      PlaceTypeDto.monument => PlaceTypeEntity.monument,
      PlaceTypeDto.theatre => PlaceTypeEntity.theatre,
      PlaceTypeDto.temple => PlaceTypeEntity.temple,
      PlaceTypeDto.hotel => PlaceTypeEntity.hotel,
    };
  }
}
