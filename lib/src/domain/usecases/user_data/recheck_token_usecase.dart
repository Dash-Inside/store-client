import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

@Injectable()
class RecheckTokenUseCase extends UseCase<bool, Unit> {
  final UserDataRepository userDataRepository = services.get<UserDataRepository>();

  @override
  FutureOr<Either<Failure, bool>> call(Unit unit) async {
    return await userDataRepository.checkUserConnectByJWT();
  }
}
