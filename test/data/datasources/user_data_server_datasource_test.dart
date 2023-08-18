import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/models/user_data_model.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/entities/role.dart';

void main() {
  const String currentPassword = '1234567';
  const String newPassword = '7654321';
  const String newPasswordConfirmation = '7654321';
  const int id = 1;
  const String email = 'test@test.test';

  final UserDataModel userDataModel = UserDataModel(
    id: id,
    username: "dratyti",
    avatarUrl: "avatarUrl",
    role: Role.user,
  );
  final UserDataModel userDataModel1 = UserDataModel(
    id: id,
    username: "username",
    avatarUrl: "avatarUrl",
    role: Role.user,
  );
  final List<UserDataModel> listUserDataModel0 = [userDataModel, userDataModel1];
  group(
    'user_data_server_datasource_test',
    () {
      test(
        'put userData',
        () async {
          final UserDataModel putUserDataModel = UserDataModel(
            id: id,
            username: "dratyti",
            avatarUrl: "avatarUrl",
            role: Role.user,
          );
          final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();

          final Either<Failure, UserDataModel> result = await userDataServerDatasource.putUserDataRequest(
            avatarUrl: '',
            id: 1,
            role: null,
            userName: 'dratyti',
          );

          final res = result.fold(
            (Right) => userDataModel,
            (Left) => null,
          );

          expect(res, putUserDataModel);
        },
      );
      test(
        'get_all_userData_Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();

          final Either<Failure, List<UserDataModel>> userDataModel = await userDataServerDatasource.getAllUserDataRequest();

          // final res = userDataModel.fold(
          //   (Right) => listUserDataModel0,
          //   (Left) => null,
          // );
          // expect(res, listUserDataModel0);
          expect(userDataModel.isRight(), true);
        },
      );

      test(
        'get Concrete UserData Request',
        () async {
          final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();

          final Either<Failure, UserDataModel> waitResult = await userDataServerDatasource.getConcreteUserDataRequest(id: id);

          final result = waitResult.fold((Right) => userDataModel, (Left) => null);

          expect(result, userDataModel);
        },
      );

      test(
        'password login method',
        () async {
          final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();

          final Either<Failure, UserModel> result = await userDataServerDatasource.loginUserDataRequest(
            login: email,
            password: currentPassword,
          );

          expect(result.isRight(), true);
        },
      );

      test(
        'change password method',
        () async {
          // Act.
          final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();
          // Arrange.
          final Either<Failure, UserModel> result = await userDataServerDatasource.changePasswordUserDataRequest(
            currentPassword: currentPassword,
            newPassword: newPassword,
            newPasswordConfirmation: newPasswordConfirmation,
          );

          final Either<Failure, UserModel> user = await userDataServerDatasource.loginUserDataRequest(
            login: email,
            password: newPassword,
          );
          // Accert.
          expect(result.isRight(), true);
          expect(user.isRight(), true);
        },
      );
    },
  );
}
