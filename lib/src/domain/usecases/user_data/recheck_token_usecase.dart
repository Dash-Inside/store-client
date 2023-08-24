import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

@Injectable()
class RecheckTokenUseCase extends UseCase<bool, Unit> {
  final UserRepository userRepository;

  RecheckTokenUseCase({
    required this.userRepository,
  });

  @override
  FutureOr<Either<Failure, bool>> call(Unit unit) async {
    return userRepository.checkUserConnectByJWT();
  }
}
