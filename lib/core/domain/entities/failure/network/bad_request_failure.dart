import 'package:surf_places/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка запроса с некорректными данными.
final class BadRequestFailure extends NetworkFailure {
  const BadRequestFailure({super.message, super.parentException, super.stackTrace});
}
