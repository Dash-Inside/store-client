import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user.dart';

abstract class UserRepository {
  /// [changeUserName] returns Either [Failure] if there is some errors or [User] if there is no errors.
  /// [changeUserName] takes [User], [newUserName] that used for change userName by [User] and get [User].
  Future<Either<Failure, User>> changeUserName({
    required User user,
    required String newUserName,
  });

  /// [changeAvatarUrl] returns Either [Failure] if there is some errors or [User] if there is no errors.
  /// [changeAvatarUrl] takes [User], [newAvatarUrl] that used for change avatarUrl by [User] and get [User].
  Future<Either<Failure, User>> changeAvatarUrl({
    required User user,
    required String newAvatarUrl,
  });

  /// [loginUser] returns Either [Failure] if there is some errors or [User] if there is no errors.
  /// [loginUser] takes [email], [password] that used for login to account and get [User].
  Future<Either<Failure, User>> loginUser({
    required String email,
    required String password,
  });

  /// [restorePasswordUser] returns Either [Failure] if there is some errors or [User] if there is no errors.
  /// [restorePasswordUser] takes [restoreCode], [password], [comfirmedPassword] that used for restore accounts password and get [User].
  Future<Either<Failure, User>> restorePasswordUser({
    required String restoreCode,
    required String password,
    required String comfirmedPassword,
  });

  /// [checkUserConnectByJWT] returns Either [Failure] if there is some errors or [bool] if there is no errors.
  /// [checkUserConnectByJWT] used for authentication account and return status of authentication [bool].
  Future<Either<Failure, bool>> checkUserConnectByJWT();
}
