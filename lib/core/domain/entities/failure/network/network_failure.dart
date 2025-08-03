import 'package:surf_places/core/domain/entities/failure/failure.dart';

/// Базовый класс для ошибок сети.
abstract class NetworkFailure extends Failure {
  const NetworkFailure({super.message, super.parentException, super.stackTrace});
}
