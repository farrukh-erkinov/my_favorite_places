import 'package:surf_places/core/domain/entities/failure/failure.dart';

/// Неизвестная ошибка.
final class UnknownFailure extends Failure {
  const UnknownFailure({super.message, super.stackTrace});
}
