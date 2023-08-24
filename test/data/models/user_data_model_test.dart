import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/user_data_model.dart';
import 'package:store_client/src/domain/entities/role.dart';

void main() {
  group('user_data_model_test', () {
    test('factory_from_map', () {
      const Map<String, dynamic> userDataMap = {
        "id": 1,
        "attributes": {
          "username": "test1",
          "role": "admin",
          "createdAt": "2023-08-16T12:51:18.834Z",
          "updatedAt": "2023-08-16T12:52:13.231Z",
          "publishedAt": "2023-08-16T12:51:57.388Z",
          "avatarUrl": 'URL',
        },
      };
      final UserModel UserModel = UserModel(
        id: 1,
        username: 'test1',
        avatarUrl: 'URL',
        role: Role.admin,
      );

      final UserModel result = UserModel.fromMap(userDataMap);

      expect(result, UserModel);
    });

    test('factory_from_Json', () {
      const String userDataJson =
          '{"id": 1,"attributes":{"username": "test1","role": "admin","createdAt": "2023-08-16T12:51:18.834Z","updatedAt": "2023-08-16T12:52:13.231Z","publishedAt": "2023-08-16T12:51:57.388Z","avatarUrl": "URL"}}';

      final UserModel UserModel = UserModel(
        id: 1,
        username: 'test1',
        avatarUrl: 'URL',
        role: Role.admin,
      );

      final UserModel result = UserModel.fromJson(userDataJson);

      expect(result, UserModel);
    });
    group('method_copy_with', () {
      test('method_copy_with_with_arguments', () {
        final UserModel UserModel1 = UserModel(
          id: 2314523452,
          username: 'wqer',
          avatarUrl: 'werqwerqwer',
          role: Role.admin,
        );

        final UserModel UserModel2 = UserModel(
          id: 2,
          username: 'test2',
          avatarUrl: 'URL',
          role: Role.user,
        );

        final UserModel result = UserModel1.copyWith(
          id: 2,
          username: 'test2',
          avatarUrl: 'URL',
          role: Role.user,
        );

        expect(result, UserModel2);
      });
      test('method_copy_with_without_any _arguments', () {
        final UserModel UserModel1 = UserModel(
          id: 0,
          username: '321321',
          avatarUrl: '123443',
          role: Role.user,
        );

        final UserModel UserModel2 = UserModel(
          id: 0,
          username: '',
          avatarUrl: '',
          role: Role.user,
        );

        UserModel result = UserModel1.copyWith(
          username: '',
          avatarUrl: '',
        );

        expect(result, UserModel2);
      });
    });
  });
  test('method_to_map', () {
    const Map<String, dynamic> userDataMap = {
      'id': 1,
      'username': 'test1',
      'avatarUrl': 'URL',
      'role': 'admin',
    };

    final UserModel UserModel = UserModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final Map<String, dynamic> result = UserModel.toMap();

    expect(result, userDataMap);
  });
  test('method_to_Json', () {
    final UserModel UserModelTest = UserModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final Map<String, dynamic> dataMap = UserModelTest.toMap();
    final String userDataJson = json.encode(dataMap);

    final UserModel UserModel = UserModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final String result = UserModel.toJson();

    expect(result, userDataJson);
  });
}
