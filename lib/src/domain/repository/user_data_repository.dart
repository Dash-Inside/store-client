import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user_data.dart';

abstract class UserDataRepository {
  /// [changeUserName] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [changeUserName] takes [userData], [newUserName] that used for change userName by [userData] and get [UserData].
  Future<Either<Failure, UserData>> changeUserName({
    required UserData userData,
    required String newUserName,
  });

  /// [changeAvatarUrl] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [changeAvatarUrl] takes [userData], [newAvatarUrl] that used for change avatarUrl by [userData] and get [UserData].
  Future<Either<Failure, UserData>> changeAvatarUrl({
    required UserData userData,
    required String newAvatarUrl,
  });

  /// [loginUser] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [loginUser] takes [email], [password] that used for login to account and get [UserData].
  Future<Either<Failure, UserData>> loginUser({
    required String email,
    required String password,
  });

  /// [restorePasswordUser] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [restorePasswordUser] takes [restoreCode], [password], [comfirmedPassword] that used for restore accounts password and get [UserData].
  Future<Either<Failure, UserData>> restorePasswordUser({
    required String restoreCode,
    required String password,
    required String comfirmedPassword,
  });

  /// [checkUserConnectByJWT] returns Either [Failure] if there is some errors or [bool] if there is no errors.
  /// [checkUserConnectByJWT] used for authentication account and return status of authentication [bool].
  Future<Either<Failure, bool>> checkUserConnectByJWT();
}
