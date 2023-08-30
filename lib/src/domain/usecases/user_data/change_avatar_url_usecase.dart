import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/failure/message_failure.dart';
import 'package:store_client/src/domain/failure/user_data_failure.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/domain/validators/change_avatar_url_validator.dart';

@Injectable()
class ChangeAvatarUrlUseCase extends UseCase<User, ChangeAvatarUrlUseCaseParams> {
  @override
  FutureOr<Either<Failure, User>> call(ChangeAvatarUrlUseCaseParams params) async {
    final UserRepository userRepository = services.get<UserRepository>();
    if (!(await ChangeAvatarUrlValidator().validate(params))) return Left(NotValidChangeAvatarUrlFailure());

    return userRepository.changeAvatarUrl(
      user: params.user,
      newAvatarUrl: params.newAvatarUrl,
    );
  }
}

class ChangeAvatarUrlUseCaseParams {
  final User user;
  final String newAvatarUrl;

  ChangeAvatarUrlUseCaseParams(
    this.user,
    this.newAvatarUrl,
  );
}
