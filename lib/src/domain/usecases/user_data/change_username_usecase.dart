import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class ChangeUserNameUseCase
    extends UseCase<UserData, ChangeUserNameUseCaseParams> {
  @override
  FutureOr<Either<Failure, UserData>> call(ChangeUserNameUseCaseParams params) {
    final UserDataRepository userDataRepository =
        services.get<UserDataRepository>();

    return userDataRepository.changeUserName(
      userData: params.userData,
      newUserName: params.newUserName,
    );
  }
}

class ChangeUserNameUseCaseParams {
  final UserData userData;
  final String newUserName;

  ChangeUserNameUseCaseParams(
    this.userData,
    this.newUserName,
  );
}
