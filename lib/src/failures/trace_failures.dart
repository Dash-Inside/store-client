//ignore_for_file: prefer-match-file-name

import 'package:store_client/core/failure/failure.dart';

class UnhandledFailure extends Failure {
  UnhandledFailure(StackTrace T) : super(message: "Unhandled Failure", stackTrace: T);
}
