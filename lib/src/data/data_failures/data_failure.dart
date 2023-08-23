import 'package:store_client/core/failure/failure.dart';

class DataFailure extends Failure {
  DataFailure({
    required super.message,
    required super.stackTrace,
  });
}

class UnhandledFailure extends Failure {
  UnhandledFailure(StackTrace T) : super(message: "Unhandled Failure", stackTrace: T);
}

class ServerFailureGetSections extends Failure {
  ServerFailureGetSections(StackTrace T) : super(message: "Server error, dont found Sections", stackTrace: T);
}

class ServerFailureGetTopics extends Failure {
  ServerFailureGetTopics(StackTrace T) : super(message: "Server error, dont found Topics", stackTrace: T);
}

class ServerFailureSendTopics extends Failure {
  ServerFailureSendTopics(StackTrace T) : super(message: "Server error, cant send Topic", stackTrace: T);
}
