abstract class Failure {
  final String message;
  final String? debugMessage;
  const Failure(this.message, {this.debugMessage});
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required String message,
    String? debugMessage,
  }) : super(message, debugMessage: debugMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(
    super.message, {
    super.debugMessage,
  });
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized access');
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Something went wrong');
}
