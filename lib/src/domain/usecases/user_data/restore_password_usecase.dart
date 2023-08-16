import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class RestorePasswordUseCase extends UseCase<UserData, RestorePasswordUseCaseParams> {
  final UserDataRepository userDataRepository = services.get<UserDataServerRepository>();

  @override
  FutureOr<Either<Failure, UserData>> call(RestorePasswordUseCaseParams params) {
    return userDataRepository.restorePasswordUser(
      restoreCode: params.restoreCode,
      password: params.password,
      comfirmedPassword: params.comfirmedPassword,
    );
  }
}

class RestorePasswordUseCaseParams {
  final String restoreCode;
  final String password;
  final String comfirmedPassword;

  RestorePasswordUseCaseParams({
    required this.restoreCode,
    required this.password,
    required this.comfirmedPassword,
  });
}
