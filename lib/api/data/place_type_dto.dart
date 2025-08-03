import 'package:json_annotation/json_annotation.dart';

/// DTO типа места.
@JsonEnum()
enum PlaceTypeDto {
  /// Ресторан.
  @JsonValue('restaurant')
  restaurant('restaurant'),

  /// Кафе.
  @JsonValue('cafe')
  cafe('cafe'),

  /// Парк.
  @JsonValue('park')
  park('park'),

  /// Музей.
  @JsonValue('museum')
  museum('museum'),

  /// Памятник.
  @JsonValue('monument')
  monument('monument'),

  /// Театр.
  @JsonValue('theatre')
  theatre('theatre'),

  /// Храм.
  @JsonValue('temple')
  temple('temple'),

  /// Отель.
  @JsonValue('hotel')
  hotel('hotel'),

  /// Магазин.
  @JsonValue('shopping')
  shopping('shopping'),

  /// Другое.
  @JsonValue('other')
  other('other');

  const PlaceTypeDto(this.json);

  factory PlaceTypeDto.fromJson(String json) => values.firstWhere((value) => value.json == json, orElse: () => other);

  final String? json;

  String? toJson() => json;
}
