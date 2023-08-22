import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart';

import '../../injector/services.dart';

Future<void> main() async {
  await initTestServices();
  final UserData userData = UserData(
    id: 1,
    username: 'Pencil',
    avatarUrl: 'avatarUrl',
    role: Role.user,
  );

  final String newUserName = 'newUserName';

  final ChangeUserNameUseCaseParams changeUserNameUseCaseParams =
      ChangeUserNameUseCaseParams(
    userData,
    newUserName,
  );

  test('change_username_usecase_test', () async {
    // Act.
    final UserDataRepository userDataRepository =
        services.get<UserDataRepository>();
    when(userDataRepository.changeUserName(
      userData: userData,
      newUserName: newUserName,
    )).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final ChangeUserNameUseCase changeUserName = ChangeUserNameUseCase();
    final Either<Failure, UserData> result =
        await changeUserName.call(changeUserNameUseCaseParams);

    // Accert.
    verify(userDataRepository.changeUserName(
      userData: userData,
      newUserName: newUserName,
    )).called(1);
    verifyNoMoreInteractions(UserDataServerRepository);
    expect(result, Right(userData));
  });
}
