import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/usecases/user_data/log_in_usecase.dart';

@GenerateNiceMocks([MockSpec<UserDataServerRepository>()])
import 'log_in_usecase_test.mocks.dart';

void main() {
  final UserData userData = UserData(
    id: 1,
    username: 'username',
    avatarUrl: 'url',
    role: Role.user,
  );

  final String email = 'email';
  final String password = 'password';

  final LogInUseCaseParams logInUseCaseParams = LogInUseCaseParams(
    email,
    password,
  );

  test('log_in_usecase_test', () async {
    // Act.
    final UserDataServerRepository userDataServerRepository = MockUserDataServerRepository();
    when(userDataServerRepository.loginUser(
      email: email,
      password: password,
    )).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final logInUseCase = LogInUseCase();
    final FutureOr<Either<Failure, UserData>> result = await logInUseCase.call(logInUseCaseParams);

    // Accert.
    verify(userDataServerRepository.loginUser(
      email: email,
      password: password,
    )).called(1);
    verifyNoMoreInteractions(UserDataServerRepository);
    expect(result, Right(userData));
  });
}
