import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user_data.dart';

abstract class UserDataRepository {
  /// [changeUserNameById] returns Either [Failure] if there is some errors or [Unit] if there is no errors.
  /// [changeUserNameById] takes [id], [newUserName] that used for change userName by id.
  Future<Either<Failure, Unit>> changeUserNameById({
    required int id,
    required String newUserName,
  });

  /// [changeAvatarUrlById] returns Either [Failure] if there is some errors or [Unit] if there is no errors.
  /// [changeAvatarUrlById] takes [id], [newAvatarUrl] that used for change avatarUrl by id.
  Future<Either<Failure, Unit>> changeAvatarUrlById({
    required int id,
    required String newAvatarUrl,
  });

  /// [getUserDataById] returns Either [Failure] if there is some errors or [UserData] if there is no errors.
  /// [getUserDataById] takes [id] that used for get [UserData] by id.
  Future<Either<Failure, UserData>> getUserDataById({required int id});
}
