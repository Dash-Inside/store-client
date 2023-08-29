//ignore_for_file: prefer-match-file-name

import 'package:store_client/core/failure/failure.dart';

class UnhandledFailure extends Failure {
  UnhandledFailure(StackTrace T) : super(message: "Unhandled Failure", stackTrace: T);
}

class ParamsFailure extends Failure {
  ParamsFailure(StackTrace T)
      : super(
          message: 'Invalid params failure',
          stackTrace: T,
        );
}

class ServerFailure extends Failure {
  ServerFailure(StackTrace T)
      : super(
          message: 'Server failure',
          stackTrace: T,
        );
}

class BadRequestFailure extends Failure {
  BadRequestFailure(StackTrace T)
      : super(
          message: 'Bad Request Error',
          stackTrace: T,
        );
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(StackTrace T)
      : super(
          message: 'Unauthorized Failure ',
          stackTrace: T,
        );
}

class ExtraFailure extends Failure {
  ExtraFailure(StackTrace T)
      : super(
          message: 'Extra Failure',
          stackTrace: T,
        );
}
