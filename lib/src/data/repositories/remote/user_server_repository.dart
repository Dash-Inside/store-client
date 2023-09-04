import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/user_server_datasource.dart';
import 'package:store_client/src/data/models/user_model.dart';

import 'package:store_client/src/domain/entities/user.dart';

import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable(as: UserRepository)
class UserServerRepository implements UserRepository {
  final UserServerDatasource userServerDatasource;

  UserServerRepository({
    required this.userServerDatasource,
  });

  @override
  Future<Either<Failure, User>> loginUser({required String email, required String password}) async {
    try {
      final Either<Failure, UserModel> failOrUser = await userServerDatasource.loginUserRequest(
        login: email,
        password: password,
      );

      return failOrUser.fold(
        (fail) => Left(UnauthorizedFailure(StackTrace.empty)),
        (user) => Right(user),
      );
    } catch (e, stackTrace) {
      return Left(UnauthorizedFailure(StackTrace.empty));
    }
  }

  @override
  Future<Either<Failure, User>> restorePasswordUser({required String restoreCode, required String password, required String comfirmedPassword}) {
    // TODO: implement restorePasswordUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> changeAvatarUrl({required User user, required String newAvatarUrl}) async {
    try {
      if (newAvatarUrl != user.avatarUrl) {
        final Either<Failure, UserModel> userModel = await userServerDatasource.putUserRequest(
          id: user.id,
          userName: user.username,
          role: user.role,
          avatarUrl: newAvatarUrl,
        );
        final int id = userModel.fold(
          (l) {
            throw l;
          },
          (r) {
            return r.id;
          },
        );

        return (await userServerDatasource.getConcreteUserRequest(id: id));
      } else {
        return Right(user);
      }
    } catch (e, stackTrace) {
      return Left(UnauthorizedFailure(StackTrace.empty));
    }
  }

  @override
  Future<Either<Failure, User>> changeUserName({required User user, required String newUserName}) async {
    try {
      if (newUserName != user.username) {
        final Either<Failure, UserModel> userModel = await userServerDatasource.putUserRequest(
          id: user.id,
          userName: newUserName,
          role: user.role,
          avatarUrl: user.avatarUrl,
        );
        final int id = userModel.fold(
          (l) {
            throw l;
          },
          (r) {
            return r.id;
          },
        );

        return (await userServerDatasource.getConcreteUserRequest(id: id));
      }

      return Right(user);
    } catch (e, stackTrace) {
      return Left(UnauthorizedFailure(StackTrace.empty));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserConnectByJWT() async {
    try {
      final Either<Failure, UserModel> userModel = await userServerDatasource.authMeUserRequest();

      return Right(userModel.fold((_) => false, (_) => true));
    } catch (e, stackTrace) {
      return Left(UnauthorizedFailure(StackTrace.empty));
    }
  }
}
