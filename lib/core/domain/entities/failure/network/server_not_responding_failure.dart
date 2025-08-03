import 'package:surf_places/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка, возникающая, когда сервер не отвечает.
final class ServerNotRespondingFailure extends NetworkFailure {
  const ServerNotRespondingFailure() : super(message: 'Server not responding');
}
