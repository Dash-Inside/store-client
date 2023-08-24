import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/models/user_data_model.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/entities/role.dart';

import '../../injector/services.dart';

Future<void> main() async {
  await initTestServices();

  const String currentPassword = '1234567';
  const String newPassword = '7654321';
  const String newPasswordConfirmation = '7654321';
  const int id = 2;
  const String email = 'test@test.test';

  final UserModel userModellogIn = UserModel(
    id: 1,
    userName: 'username',
    email: email,
  );

  final UserModel UserModel = UserModel(
    id: id,
    username: "dratyti",
    avatarUrl: "534",
    role: Role.user,
  );
  final List<UserModel> listUserModel0 = [UserModel];
  group(
    'user_data_server_datasource_test',
    () {
      test(
        'put userData',
        () async {
          final UserModel putUserModel = UserModel(
            id: id,
            username: "dratyti",
            avatarUrl: "534",
            role: Role.user,
          );
          final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

          final Either<Failure, UserModel> result = await userDataServerDatasource.putUserDataRequest(
            avatarUrl: '',
            id: 2,
            role: Role.user,
            userName: 'dratyti',
          );

          final res = result.fold(
            (left) => left,
            (right) => right,
          );
          print(result);
          expect(res, putUserModel);
        },
      );
      test(
        'get_all_userData_Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

          final Either<Failure, List<UserModel>> UserModel = await userDataServerDatasource.getAllUserDataRequest();
          print(UserModel);
          final res = UserModel.fold(
            (left) => left,
            (right) => right,
          );
          print(res);
          expect(res, listUserModel0);
        },
      );

      test(
        'get Concrete UserData Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

          final Either<Failure, UserModel> waitResult = await userDataServerDatasource.getConcreteUserDataRequest(id: id);

          final result = waitResult.fold(
            (left) => left,
            (right) => right,
          );

          expect(result, UserModel);
        },
      );

      test(
        'password login method',
        () async {
          final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

          final Either<Failure, UserModel> result = await userDataServerDatasource.loginUserDataRequest(
            login: email,
            password: currentPassword,
          );

          final res = result.fold(
            (left) => left,
            (right) => right,
          );

          expect(res, userModellogIn);
        },
      );

      test(
        'change password method',
        () async {
          final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

          final Either<Failure, UserModel> result = await userDataServerDatasource.changePasswordUserDataRequest(
            currentPassword: currentPassword,
            newPassword: newPassword,
            newPasswordConfirmation: newPasswordConfirmation,
          );

          final Either<Failure, UserModel> user = await userDataServerDatasource.loginUserDataRequest(
            login: email,
            password: newPassword,
          );

          expect(result.isRight(), true);
          expect(user.isRight(), true);
        },
      );
    },
  );
}
