sealed class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

class ErrorAuthException extends AuthException {
  ErrorAuthException({required super.message});
}

class UnAuthorizedAuthException extends AuthException {
  UnAuthorizedAuthException() : super(message: 'UnAuthorizedAuthException');
}
