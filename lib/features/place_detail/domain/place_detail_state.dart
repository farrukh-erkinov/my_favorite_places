import 'package:flutter/cupertino.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';

/// Состояние экрана детальной информации о месте.
@immutable
class PlaceDetailState {
  /// Место.
  final PlaceEntity place;

  const PlaceDetailState({required this.place});
}
