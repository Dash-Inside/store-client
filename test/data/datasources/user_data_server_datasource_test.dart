import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
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

  final UserDataModel userDataModel = UserDataModel(
    id: id,
    username: "dratyti",
    avatarUrl: "534",
    role: Role.user,
  );
  final List<UserDataModel> listUserDataModel0 = [userDataModel];
  group(
    'user_data_server_datasource_test',
    () {
      test(
        'put userData',
        () async {
          final UserDataModel putUserDataModel = UserDataModel(
            id: id,
            username: "dratyti",
            avatarUrl: "534",
            role: Role.user,
          );
          final UserDataServerDatasource userDataServerDatasource = testServices.get<UserDataServerDatasource>();

          final Either<Failure, UserDataModel> result = await userDataServerDatasource.putUserDataRequest(
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
          expect(res, putUserDataModel);
        },
      );
      test(
        'get_all_userData_Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = testServices.get<UserDataServerDatasource>();

          final Either<Failure, List<UserDataModel>> userDataModel = await userDataServerDatasource.getAllUserDataRequest();
          print(userDataModel);
          final res = userDataModel.fold(
            (left) => left,
            (right) => right,
          );
          print(res);
          expect(res, listUserDataModel0);
        },
      );

      test(
        'get Concrete UserData Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = testServices.get<UserDataServerDatasource>();

          final Either<Failure, UserDataModel> waitResult = await userDataServerDatasource.getConcreteUserDataRequest(id: id);

          final result = waitResult.fold(
            (left) => left,
            (right) => right,
          );

          expect(result, userDataModel);
        },
      );

      test(
        'password login method',
        () async {
          final UserDataServerDatasource userDataServerDatasource = testServices.get<UserDataServerDatasource>();

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
          final UserDataServerDatasource userDataServerDatasource = testServices.get<UserDataServerDatasource>();

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
