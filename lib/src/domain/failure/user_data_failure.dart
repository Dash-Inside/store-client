import 'package:store_client/core/failure/failure.dart';

class NotValidChangeAvatarUrlFailure extends Failure {
  NotValidChangeAvatarUrlFailure() : super(message: 'Not Valid Change Avatar Url Failure', stackTrace: StackTrace.empty);
}

class NotValidChangeUserNameFailure extends Failure {
  NotValidChangeUserNameFailure() : super(message: 'Not Valid Change User Name Failure', stackTrace: StackTrace.empty);
}
