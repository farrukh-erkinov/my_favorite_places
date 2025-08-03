/// {@template result.class}
/// Result of a function execution.
///
/// [Result.ok] - named constructor for a successful Result - [Result].
///
/// [Result.failed] - named constructor for Result with error - [ResultFailed].
/// {@endtemplate}
sealed class Result<TData, TErr extends Object> {
  /// {@macro result.class}
  const Result();

  /// {@macro result.class}
  const factory Result.failed(TErr failure, StackTrace stackTrace) = ResultFailed;

  /// {@macro result.class}
  const factory Result.ok(TData data) = ResultOk;

  /// If the result is [ResultOk] unwraps it, otherwise returns null.
  TData? get dataOrNull {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => data,
      ResultFailed<TData, TErr>() => null,
    };
  }

  /// Returns `true` if the result is [ResultFailed].
  bool get isFailed => this is ResultFailed<TData, TErr>;

  /// Returns `true` if the result is [ResultOk].
  bool get isOk => this is ResultOk<TData, TErr>;

  /// Convert [ResultOk].
  // ignore: prefer-typedefs-for-callbacks
  Result<R, TErr> mapOk<R>(R Function(TData value) mapper) {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => Result.ok(mapper(data)),
      ResultFailed<TData, TErr>(:final error, :final stackTrace) => Result.failed(error, stackTrace),
    };
  }

  /// Unwraps result as [TData].
  ///
  /// Rethrows an exception if the result is [ResultFailed].
  ///
  /// Designed for cases when you are using repository calls outside of the business logic
  /// and it is ok to rethrow the exception and catch it in the root level handler.
  TData unwrap() {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => data,
      ResultFailed<TData, TErr>(:final error, :final stackTrace) => Error.throwWithStackTrace(error, stackTrace),
    };
  }

  /// If the result is [ResultOk] unwraps it, otherwise returns [defaultValue].
  TData unwrapOr(TData defaultValue) {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => data,
      ResultFailed<TData, TErr>() => defaultValue,
    };
  }
}

/// {@macro result.class}
final class ResultOk<TData, TErr extends Object> extends Result<TData, TErr> {
  /// Successful Result data.
  final TData data;

  /// {@macro result.class}
  const ResultOk(this.data);
}

/// {@macro result.class}
final class ResultFailed<TData, TErr extends Object> extends Result<TData, TErr> {
  /// Error.
  final TErr error;

  /// Stack Trace.
  final StackTrace stackTrace;

  /// {@macro result.class}
  const ResultFailed(this.error, this.stackTrace);
}
