import 'package:equatable/equatable.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';

/// Entity that combines information about a [PlaceEntity] and whether it is currently liked (added to favourites).
class LikedPlaceEntity extends Equatable {
  const LikedPlaceEntity({required this.place, required this.isFavorite});

  /// Место.
  final PlaceEntity place;

  /// Флаг, указывающий, добавлено ли место в избранное.
  final bool isFavorite;

  @override
  List<Object?> get props => [place, isFavorite];
}
