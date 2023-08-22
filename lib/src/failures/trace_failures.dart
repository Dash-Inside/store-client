//ignore_for_file: prefer-match-file-name

import 'package:store_client/core/failure/failure.dart';

class UnhandledFailure extends Failure {
  UnhandledFailure(StackTrace T) : super(message: "Unhandled Failure", stackTrace: T);
}

class ParamsFailure extends Failure {
  ParamsFailure(StackTrace T)
      : super(
          message: 'Invalid params',
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
