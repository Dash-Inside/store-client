import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user_data.dart';

abstract class UserDataRepository {
  /// [changeUserNameUserData] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [changeUserNameUserData] takes [userData], [newUserName] that used for change userName by [userData] and get [UserData].
  Future<Either<Failure, UserData>> changeUserNameUserData({
    required UserData userData,
    required String newUserName,
  });

  /// [changeAvatarUrlByUserData] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [changeAvatarUrlByUserData] takes [userData], [newAvatarUrl] that used for change avatarUrl by [userData] and get [UserData].
  Future<Either<Failure, UserData>> changeAvatarUrlByUserData({
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
}
