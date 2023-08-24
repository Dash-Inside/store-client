import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class UserDataServerRepository implements UserDataRepository {
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
}
