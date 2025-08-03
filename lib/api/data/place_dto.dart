import 'package:json_annotation/json_annotation.dart';
import 'package:surf_places/api/data/place_type_dto.dart';

part 'place_dto.g.dart';

/// DTO места.
@JsonSerializable(createToJson: false)
class PlaceDto {
  /// Идентификатор.
  final int id;

  /// Название.
  final String name;

  /// Широта.
  final double lat;

  /// Долгота.
  @JsonKey(name: 'lng')
  final double lon;

  /// Описание.
  final String description;

  /// Тип места.
  @JsonKey(name: 'type')
  final PlaceTypeDto placeType;

  /// Ссылки на картинки.
  @JsonKey(name: 'urls')
  final List<String> images;

  const PlaceDto({
    required this.id,
    required this.name,
    required this.description,
    required this.placeType,
    required this.images,
    required this.lat,
    required this.lon,
  });

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);
}
