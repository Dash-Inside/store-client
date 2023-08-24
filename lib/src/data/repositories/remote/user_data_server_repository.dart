import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/models/user_model.dart';

import 'package:store_client/src/domain/entities/user.dart';

import 'package:store_client/src/domain/repository/user_data_repository.dart';

@Injectable(as: UserDataRepository)
class UserDataServerRepository implements UserDataRepository {
  final UserDataServerDatasource userDataServerDatasource = services.get<UserDataServerDatasource>();

  @override
  Future<Either<Failure, User>> loginUser({required String email, required String password}) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> restorePasswordUser({required String restoreCode, required String password, required String comfirmedPassword}) {
    // TODO: implement restorePasswordUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> changeAvatarUrl({required User userData, required String newAvatarUrl}) {
    // TODO: implement changeAvatarUrl
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> changeUserName({required User userData, required String newUserName}) {
    // TODO: implement changeUserName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> checkUserConnectByJWT() async {
    try {
      final Either<Failure, UserModel> userModel = await userDataServerDatasource.authMeUserDataRequest();
      final bool authStatus = userModel.fold(
        (l) {
          throw l;
        },
        (r) {
          return true;
        },
      );

      return Right(authStatus);
    } catch (e, stackTrace) {
      return Left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }
}
