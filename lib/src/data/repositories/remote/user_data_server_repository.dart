import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

class UserDataServerRepository implements UserDataRepository {
  @override
  Future<Either<Failure, UserData>> loginUser({required String email, required String password}) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserData>> restorePasswordUser({required String restoreCode, required String password, required String comfirmedPassword}) {
    // TODO: implement restorePasswordUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserData>> changeAvatarUrl({required UserData userData, required String newAvatarUrl}) {
    // TODO: implement changeAvatarUrl
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserData>> changeUserName({required UserData userData, required String newUserName}) {
    // TODO: implement changeUserName
    throw UnimplementedError();
  }
}
