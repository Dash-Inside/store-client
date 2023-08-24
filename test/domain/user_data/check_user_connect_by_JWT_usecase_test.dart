import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/usecases/user_data/check_user_connect_by_JWT_usecase.dart';

import '../../injector/services.dart';

Future<void> main() async {
  await initTestServices();
  group(
    "check_user_connect_by_JWT_usecase_test",
    () {
      test(
        'connection completed',
        () async {
          final UserDataRepository userDataRepository = services.get<UserDataRepository>();
          when(userDataRepository.checkUserConnectByJWT()).thenAnswer((_) async {
            return Right(true);
          });

          final CheckUserConnectByJWTUseCase checkUserConnectByJWTUseCase = CheckUserConnectByJWTUseCase();

          final Either<Failure, bool> result = await checkUserConnectByJWTUseCase.call(unit);
          verify(userDataRepository.checkUserConnectByJWT()).called(1);
          verifyNoMoreInteractions(userDataRepository);
          expect(result, Right(true));
        },
      );

      test(
        'connection failed',
        () async {
          final UserDataRepository userDataRepository = services.get<UserDataRepository>();
          when(userDataRepository.checkUserConnectByJWT()).thenAnswer((_) async {
            return Right(false);
          });

          final CheckUserConnectByJWTUseCase checkUserConnectByJWTUseCase = CheckUserConnectByJWTUseCase();

          final Either<Failure, bool> result = await checkUserConnectByJWTUseCase.call(unit);
          verify(userDataRepository.checkUserConnectByJWT()).called(1);
          verifyNoMoreInteractions(userDataRepository);
          expect(result, Right(false));
        },
      );
    },
  );
}
