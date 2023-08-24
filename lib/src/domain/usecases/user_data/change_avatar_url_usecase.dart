import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class ChangeAvatarUrlUseCase extends UseCase<User, ChangeAvatarUrlUseCaseParams> {
  @override
  FutureOr<Either<Failure, User>> call(ChangeAvatarUrlUseCaseParams params) {
    final UserDataRepository userDataRepository = services.get<UserDataRepository>();

    return userDataRepository.changeAvatarUrl(
      userData: params.userData,
      newAvatarUrl: params.newAvatarUrl,
    );
  }
}

class ChangeAvatarUrlUseCaseParams {
  final User userData;
  final String newAvatarUrl;

  ChangeAvatarUrlUseCaseParams(
    this.userData,
    this.newAvatarUrl,
  );
}
