import 'package:json_annotation/json_annotation.dart';

part 'error_response_dto.g.dart';

/// Содержит себе всю информацию о произошедшей в логике на сервере ошибке.
@JsonSerializable(includeIfNull: false)
class ErrorResponseDto {
  /// Код ошибки.
  @JsonKey(name: 'code')
  final int code;

  /// Сообщение, которое возможно будет показано на UI,
  /// либо будет использовано только для информирования разработчиков.
  @JsonKey(name: 'detail')
  final String? detail;

  const ErrorResponseDto({required this.code, this.detail});

  /// From Json.
  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) => _$ErrorResponseDtoFromJson(json);

  /// To Json.
  Map<String, dynamic> toJson() => _$ErrorResponseDtoToJson(this);
}
