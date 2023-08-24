import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

@Injectable()
class ChangeAvatarUrlUseCase extends UseCase<User, ChangeAvatarUrlUseCaseParams> {
  @override
  FutureOr<Either<Failure, User>> call(ChangeAvatarUrlUseCaseParams params) {
    final UserRepository userRepository = services.get<UserRepository>();

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
