import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/entities/role.dart';

@Injectable()
class UserDataServerDatasource {
  final Dio client = Dio();

  static const String _jwtKey = 'JWT';

  Future<Either<Failure, List<UserModel>>> getAllUserDataRequest() async {
    try {
      final Response response = await client.get('http://127.0.0.1:1337/api/user-data/');
      final List<dynamic> listMapAllRequest = response.data['data'];
      final List<UserModel> result = [];
      listMapAllRequest.forEach((element) {
        result.add(UserModel.fromMap(element as Map<String, dynamic>));
      });

      return Right(result);
    } catch (e, stackTrace) {
      return Left(Failure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> getConcreteUserDataRequest({
    required int id,
  }) async {
    try {
      final Response response = await client.get('http://127.0.0.1:1337/api/user-data/$id');

      return Right(UserModel.fromMap(response.data['data']));
    } catch (e, stackTrace) {
      return Left(Failure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> putUserDataRequest({
    required int id,
    required String? userName,
    required Role? role,
    required String? avatarUrl,
  }) async {
    try {
      final Map<String, dynamic> mapParams = {'data': {}};

      if (userName != null && userName.length >= 1) {
        mapParams['data']['username'] = userName;
      }
      if (role != null) {
        mapParams['data']['role'] = role.toString().replaceFirst('Role.', '');
      }
      if (avatarUrl != null && avatarUrl.length >= 1) {
        mapParams['data']['avatarUrl'] = avatarUrl;
      }

      final Response response = await client.put(
        'http://127.0.0.1:1337/api/user-data/$id',
        data: mapParams,
      );

      return Right(UserModel.fromMap(response.data['data']));
    } catch (e, stackTrace) {
      return Left(Failure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> loginUserDataRequest({
    required String login,
    required String password,
  }) async {
    try {
      final FlutterSecureStorage flutterSecureStorage = services.get<FlutterSecureStorage>();
      final Response response = await client.post(
        'http://127.0.0.1:1337/api/auth/local',
        data: <String, dynamic>{
          "identifier": login,
          "password": password,
        },
      );
      await flutterSecureStorage.write(key: _jwtKey, value: response.data['jwt']);

      return Right(UserModel.fromMap(response.data['user']));
    } catch (e, stackTrace) {
      return Left(Failure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> changePasswordUserDataRequest({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      final FlutterSecureStorage flutterSecureStorage = services.get<FlutterSecureStorage>();
      final Response response = await client.post(
        'http://127.0.0.1:1337/api/auth/change-password',
        options: Options(headers: {'Authorization': 'Bearer ${await flutterSecureStorage.read(key: _jwtKey)}'}),
        data: jsonEncode(
          <String, dynamic>{
            "currentPassword": currentPassword,
            "password": newPassword,
            "passwordConfirmation": newPasswordConfirmation,
          },
        ),
      );
      await flutterSecureStorage.write(key: _jwtKey, value: response.data['jwt']);

      return Right(UserModel.fromMap(response.data['user']));
    } catch (e, stackTrace) {
      return Left(Failure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> authMeUserDataRequest() async {
    try {
      final FlutterSecureStorage flutterSecureStorage = services.get<FlutterSecureStorage>();
      final Response response = await client.get(
        'http://127.0.0.1:1337/api/users/me',
        options: Options(
          headers: {'Authorization': 'Bearer ${await flutterSecureStorage.read(key: _jwtKey)}'},
        ),
      );

      return Right(UserModel.fromMap(response.data));
    } catch (e, stackTrace) {
      return Left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }
}
