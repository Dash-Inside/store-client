import 'package:dartz/dartz.dart';
import 'package:store_client/src/data/data_errors/data_errors.dart';

class StatusCodeHandler {
  static Unit check(String code) {
    switch (code) {
      case '200':
        return unit;
      case '400':
        throw BadRequestError(stackTrace: StackTrace.empty);
      case '401':
        throw UnauthorizedError(stackTrace: StackTrace.empty);
      case '403':
        throw ForbiddenError(stackTrace: StackTrace.empty);
      case '404':
        throw NotFoundError(stackTrace: StackTrace.empty);
      case '500':
        throw InternalServerError(stackTrace: StackTrace.empty);
      default:
        throw UndefiendError(stackTrace: StackTrace.empty);
    }
  }
}
