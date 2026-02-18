class ServerException implements Exception {
  final String? message;

  ServerException([this.message]);
}

class ConnectionException implements Exception {
  final String? message;

  ConnectionException([this.message]);
}

class BadRequestException implements Exception {
  final String? message;

  BadRequestException([this.message]);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
