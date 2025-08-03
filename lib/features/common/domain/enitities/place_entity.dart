import 'package:equatable/equatable.dart';
import 'package:surf_places/features/common/domain/enitities/place_type_entity.dart';

/// Сущность места.
class PlaceEntity extends Equatable {
  const PlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.lat,
    required this.lon,
    required this.placeType,
  });

  /// Идентификатор.
  final int id;

  /// Название.
  final String name;

  /// Описание.
  final String description;

  /// Ссылки на картинки.
  final List<String> images;

  /// Широта.
  final double lat;

  /// Долгота.
  final double lon;

  /// Тип места.
  final PlaceTypeEntity placeType;

  @override
  List<Object?> get props => [id, name, description, images, lat, lon, placeType];
}
