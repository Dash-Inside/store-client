import 'package:store_client/core/failure/failure.dart';

class NotValidMessageFailure extends Failure {
  NotValidMessageFailure() : super(message: 'Not Valid Message Failure', stackTrace: StackTrace.empty);
}
