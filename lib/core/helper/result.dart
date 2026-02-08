import '../errors/failure.dart';

sealed class Result<T> {
  const Result();
  const factory Result.ok(T value) = Ok._;
  const factory Result.error(Failure error) = Error._;
  R when<R>({
    required R Function(T value) success,
    required R Function(Failure error) failure,
  }) {
    switch (this) {
      case Ok(:final value):
        return success(value);
      case Error(:final error):
        return failure(error);
    }
  }
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T> {
  const Error._(this.error);
  final Failure error;

  @override
  String toString() => 'Result<$T>.error($error)';
}
