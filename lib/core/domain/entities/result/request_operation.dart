import 'package:surf_places/core/domain/entities/failure/failure.dart';
import 'package:surf_places/core/domain/entities/result/result.dart';

/// Typedef for all methods that may fail.
/// These are mostly repository methods.
typedef RequestOperation<T> = Future<Result<T, Failure>>;
