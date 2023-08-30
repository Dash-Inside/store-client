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
          message: 'Bad Request Error',
          stackTrace: T,
        );
}

class ExtraFailure extends Failure {
  ExtraFailure(StackTrace T)
      : super(
          message: 'Bad Request Error',
          stackTrace: T,
        );
}

class IncorrectTopicIdFailure extends Failure {
  IncorrectTopicIdFailure(StackTrace T)
      : super(
          message: 'Invalid Topic Id',
          stackTrace: T,
        );
}

class IncorrectSectionIdFailure extends Failure {
  IncorrectSectionIdFailure(StackTrace T)
      : super(
          message: 'Invalid Section Id',
          stackTrace: T,
        );
}

class IncorrectFavoriteIdFailure extends Failure {
  IncorrectFavoriteIdFailure(StackTrace T)
      : super(
          message: 'Invalid Favorite Id',
          stackTrace: T,
        );
}

class IncorrectTopicTitleFailure extends Failure {
  IncorrectTopicTitleFailure(StackTrace T)
      : super(
          message: 'Invalid Topic Title',
          stackTrace: T,
        );
}

class IncorrectTopicParamsFailure extends Failure {
  IncorrectTopicParamsFailure(StackTrace T)
      : super(
          message: 'Invalid Topic Parameters',
          stackTrace: T,
        );
}
