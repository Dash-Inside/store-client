import 'package:store_client/core/failure/failure.dart';

class DataFailure extends Failure {
  DataFailure({
    required super.message,
    required super.stackTrace,
  });
}
