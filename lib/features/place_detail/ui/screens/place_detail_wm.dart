import 'package:flutter/material.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:surf_places/features/place_detail/ui/widgets/heart_animation_widget.dart';

/// WM для экрана детальной информации о месте.
abstract class IPlaceDetailWM {
  /// Место.
  PlaceEntity get placeEntity;

  /// Обработчик нажатия на кнопку "лайк".
  void onLikePressed();

  /// Проверяет, добавлено ли место в избранное.
  bool isFavorite();

  /// Ключ для анимации сердца.
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey;
}

/// Реализация WM для экрана детальной информации о месте.
class PlaceDetailWM implements IPlaceDetailWM {
  final IPlaceDetailModel _model;
  final _heartAnimationKey = GlobalKey<HeartAnimationWidgetState>();

  PlaceDetailWM(this._model);

  @override
  PlaceEntity get placeEntity => _model.placeEntity;

  @override
  GlobalKey<HeartAnimationWidgetState> get heartAnimationKey => _heartAnimationKey;

  @override
  void onLikePressed() {
    final needToAnimate = _model.toggleFavorite();

    if (needToAnimate) {
      _heartAnimationKey.currentState?.animate();
    }
  }

  @override
  bool isFavorite() {
    return _model.isFavorite();
  }
}
