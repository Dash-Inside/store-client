import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

@Injectable()
class LogInUseCase extends UseCase<User, LogInUseCaseParams> {
  @override
  FutureOr<Either<Failure, User>> call(LogInUseCaseParams params) {
    final UserRepository userRepository = services.get<UserRepository>();

    return userRepository.loginUser(
      email: params.email,
      password: params.password,
    );
  }
}

class LogInUseCaseParams {
  final String email;
  final String password;

  LogInUseCaseParams({
    required this.email,
    required this.password,
  });
}
