import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';

import '../../../injector/services.dart';

Future<void> main() async {
  await initTestServices();

  const String email = 'email@email.com';
  const String password = 'password';

  const String restoreCode = 'restoreCode';
  const String comfirmedPassword = 'comfirmedPassword';

  final UserData userData = UserData(
    id: 1,
    username: 'username',
    avatarUrl: 'avatarUrl',
    role: Role.user,
  );
  const String newAvatarUrl = 'newAvatarUrl';

  const String newUserName = 'newUserName';

  group('user_data_server_repository_test', () {
    test('method loginUser test', () async {
      // Act.
      final UserDataServerRepository userDataServerDatasource = testServices.get<UserDataServerRepository>();

      // Arrange.
      final Either<Failure, UserData> result = await userDataServerDatasource.loginUser(
        email: email,
        password: password,
      );

      // Accert.
      expect(result.isRight(), true);
    });

    test('method restorePasswordUser test', () async {
      // Act.
      final UserDataServerRepository userDataServerDatasource = testServices.get<UserDataServerRepository>();

      // Arrange.
      final Either<Failure, UserData> result = await userDataServerDatasource.restorePasswordUser(
        restoreCode: restoreCode,
        password: password,
        comfirmedPassword: comfirmedPassword,
      );

      // Accert.
      expect(result.isRight(), true);
    });

    test('method changeAvatarUrl test', () async {
      // Act.
      final UserDataServerRepository userDataServerRepository = testServices.get<UserDataServerRepository>();

      // Arrange.
      final Either<Failure, UserData> request = await userDataServerRepository.changeAvatarUrl(
        userData: userData,
        newAvatarUrl: newAvatarUrl,
      );
      final result = request.fold(
        (l) => l,
        (r) => expect(r.avatarUrl == newAvatarUrl, true),
      );

      // Accert.
      expect(request.isRight(), true);
    });

    test('method changeUserName test', () async {
      // Act.
      final UserDataServerRepository userDataServerRepository = testServices.get<UserDataServerRepository>();

      // Arrange.
      final Either<Failure, UserData> request = await userDataServerRepository.changeUserName(
        userData: userData,
        newUserName: newUserName,
      );
      final result = request.fold(
        (l) => l,
        (r) => expect(r.username == newUserName, true),
      );

      // Accert.
      expect(request.isRight(), true);
    });
  });
}
