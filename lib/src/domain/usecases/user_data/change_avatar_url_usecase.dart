import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class ChangeAvatarUrlUseCase extends UseCase<UserData, ChangeAvatarUrlUseCaseParams> {
  final UserDataRepository userDataRepository = services.get<UserDataServerRepository>();

  @override
  FutureOr<Either<Failure, UserData>> call(ChangeAvatarUrlUseCaseParams params) {
    return userDataRepository.changeAvatarUrl(
      userData: params.userData,
      newAvatarUrl: params.newAvatarUrl,
    );
  }
}

class ChangeAvatarUrlUseCaseParams {
  final UserData userData;
  final String newAvatarUrl;

  ChangeAvatarUrlUseCaseParams(
    this.userData,
    this.newAvatarUrl,
  );
}
