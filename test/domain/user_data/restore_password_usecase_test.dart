import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/usecases/user_data/restore_password_usecase.dart';

@GenerateNiceMocks([MockSpec<UserDataServerRepository>()])
import 'restore_password_usecase_test.mocks.dart';

void main() {
  final UserData userData = UserData(
    id: 1,
    username: 'username',
    avatarUrl: 'avatarUrl',
    role: Role.user,
  );
  final String restoreCode = 'restoreCode';
  final String password = 'password';
  final String comfirmedPassword = 'comfirmedPassword';

  final RestorePasswordUseCaseParams restorePasswordUseCaseParams = RestorePasswordUseCaseParams(
    restoreCode: restoreCode,
    password: password,
    comfirmedPassword: comfirmedPassword,
  );

  test('restore_password_usecase_test', () async {
    // Act.
    final UserDataServerRepository userDataServerRepository = MockUserDataServerRepository();
    when(userDataServerRepository.restorePasswordUser(
      restoreCode: restoreCode,
      password: password,
      comfirmedPassword: comfirmedPassword,
    )).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final restorePasswordUseCase = RestorePasswordUseCase();
    final FutureOr<Either<Failure, UserData>> result = restorePasswordUseCase.call(restorePasswordUseCaseParams);

    // Accert.
    verifyNoMoreInteractions(UserDataServerRepository);
    verify(userDataServerRepository.restorePasswordUser(
      restoreCode: restoreCode,
      password: password,
      comfirmedPassword: comfirmedPassword,
    )).called(1);
    expect(result, Right(userData));
  });
}
