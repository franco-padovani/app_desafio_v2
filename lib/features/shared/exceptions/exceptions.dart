class PersonalizedException implements Exception {
  final String message;
  final int errorCode;

  PersonalizedException({required this.message, required this.errorCode})
      : super();

  @override
  String toString() => "BadRequest: $message (Error code: $errorCode)";
}

class BadRequestException extends PersonalizedException {
  BadRequestException({
    required super.message,
    required super.errorCode,
  });
}

class ForbiddenException extends PersonalizedException {
  ForbiddenException({
    required super.message,
    required super.errorCode,
  });
}

class NotFoundException extends PersonalizedException {
  NotFoundException({
    required super.message,
    required super.errorCode,
  });
}

class GenericException extends PersonalizedException {
  GenericException({
    required super.message,
    required super.errorCode,
  });
}
