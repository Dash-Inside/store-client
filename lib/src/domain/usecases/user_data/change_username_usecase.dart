import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/failure/user_data_failure.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/domain/validators/change_username_validator.dart';

@Injectable()
class ChangeUserNameUseCase extends UseCase<User, ChangeUserNameUseCaseParams> {
  @override
  FutureOr<Either<Failure, User>> call(ChangeUserNameUseCaseParams params) async {
    final UserRepository userRepository = services.get<UserRepository>();
    if (!(await ChangeUserNameValidator().validate(params))) return Left(NotValidChangeUserNameFailure());

    return userRepository.changeUserName(
      user: params.user,
      newUserName: params.newUserName,
    );
  }
}

class ChangeUserNameUseCaseParams {
  final User user;
  final String newUserName;

  ChangeUserNameUseCaseParams(
    this.user,
    this.newUserName,
  );
}
