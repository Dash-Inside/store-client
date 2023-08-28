import 'package:store_client/core/errors/errors.dart';

class BadRequestError extends Errors {
  BadRequestError({required super.stackTrace});
}

class UnauthorizedError extends Errors {
  UnauthorizedError({required super.stackTrace});
}

class ForbiddenError extends Errors {
  ForbiddenError({required super.stackTrace});
}

class NotFoundError extends Errors {
  NotFoundError({required super.stackTrace});
}

class InternalServerError extends Errors {
  InternalServerError({required super.stackTrace});
}

class UndefiendError extends Errors {
  UndefiendError({required super.stackTrace});
}
