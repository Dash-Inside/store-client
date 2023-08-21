import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/data_failures/data_failure.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/models/user_data_model.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class UserDataServerRepository implements UserDataRepository {
  final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

  @override
  Future<Either<Failure, UserData>> loginUser({required String email, required String password}) async {
    try {
      final Either<Failure, UserModel> userModel = await userDataServerDatasource.loginUserDataRequest(login: email, password: password);
      final int id = userModel.fold(
        (l) {
          throw l;
        },
        (r) {
          return r.id;
        },
      );

      return (await userDataServerDatasource.getConcreteUserDataRequest(id: id));
    } catch (e, stackTrace) {
      return Left(DataFailure(message: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserData>> restorePasswordUser({required String restoreCode, required String password, required String comfirmedPassword}) {
    // TODO: implement restorePasswordUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserData>> changeAvatarUrl({required UserData userData, required String newAvatarUrl}) async {
    try {
      final Either<Failure, UserDataModel> userDataModel = await userDataServerDatasource.putUserDataRequest(
        id: userData.id,
        userName: userData.username,
        role: userData.role,
        avatarUrl: newAvatarUrl,
      );
      final int id = userDataModel.fold(
        (l) {
          throw l;
        },
        (r) {
          return r.id;
        },
      );

      return (await userDataServerDatasource.getConcreteUserDataRequest(id: id));
    } catch (e, stackTrace) {
      return left(DataFailure(message: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserData>> changeUserName({required UserData userData, required String newUserName}) async {
    try {
      final Either<Failure, UserDataModel> userDataModel = await userDataServerDatasource.putUserDataRequest(
        id: userData.id,
        userName: newUserName,
        role: userData.role,
        avatarUrl: userData.avatarUrl,
      );
      final int id = userDataModel.fold(
        (l) {
          throw l;
        },
        (r) {
          return r.id;
        },
      );

      return (await userDataServerDatasource.getConcreteUserDataRequest(id: id));
    } catch (e, stackTrace) {
      return left(DataFailure(message: e.toString(), stackTrace: stackTrace));
    }
  }
}
