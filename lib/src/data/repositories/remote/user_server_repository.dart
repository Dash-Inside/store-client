import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/data_errors/data_errors.dart';
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
  Future<Either<Failure, UserModel>> loginUser({required String email, required String password}) async {
    try {
      final UserModel userModel = await userServerDatasource.loginUserRequest(
        login: email,
        password: password,
      );

      return Right(userModel);
    } on BadRequestError {
      return Left(
        BadRequestFailure(StackTrace.empty),
      );
    } on UnauthorizedError {
      return Left(
        UnauthorizedFailure(StackTrace.empty),
      );
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return Left(
        ExtraFailure(StackTrace.empty),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, UserModel>> restorePasswordUser({
    required String restoreCode,
    required String password,
    required String comfirmedPassword,
  }) {
    // TODO: implement restorePasswordUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> changeAvatarUrl({
    required User user,
    required String newAvatarUrl,
  }) async {
    try {
      if (newAvatarUrl != user.avatarUrl) {
        final UserModel userModel = await userServerDatasource.putUserRequest(
          id: user.id,
          userName: user.username,
          role: user.role,
          avatarUrl: newAvatarUrl,
        );

        return Right(await userServerDatasource.getConcreteUserRequest(id: user.id));
      } else {
        final UserModel userModel = await userServerDatasource.getConcreteUserRequest(id: user.id);

        return Right(userModel);
      }
    } on BadRequestError {
      return Left(
        BadRequestFailure(StackTrace.empty),
      );
    } on UnauthorizedError {
      return Left(
        UnauthorizedFailure(StackTrace.empty),
      );
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return Left(
        ExtraFailure(StackTrace.empty),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, UserModel>> changeUserName({
    required User user,
    required String newUserName,
  }) async {
    try {
      if (newUserName != user.username) {
        final UserModel userModel = await userServerDatasource.putUserRequest(
          id: user.id,
          userName: newUserName,
          role: user.role,
          avatarUrl: user.avatarUrl,
        );

        return Right(await userServerDatasource.getConcreteUserRequest(id: user.id));
      } else {
        final UserModel userModel = await userServerDatasource.getConcreteUserRequest(id: user.id);

        return Right(userModel);
      }
    } on BadRequestError {
      return Left(
        BadRequestFailure(StackTrace.empty),
      );
    } on UnauthorizedError {
      return Left(
        UnauthorizedFailure(StackTrace.empty),
      );
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return Left(
        ExtraFailure(StackTrace.empty),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserConnectByJWT() async {
    try {
      final UserModel userModel = await userServerDatasource.authMeUserRequest();

      return Right(true);
    } on BadRequestError {
      return Left(
        BadRequestFailure(StackTrace.empty),
      );
    } on UnauthorizedError {
      return Left(
        UnauthorizedFailure(StackTrace.empty),
      );
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return Left(
        ExtraFailure(StackTrace.empty),
      );
    } catch (_) {
      rethrow;
    }
  }
}
