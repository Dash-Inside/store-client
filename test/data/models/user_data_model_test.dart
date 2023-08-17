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
      final UserDataModel userDataModel = UserDataModel(
        id: 1,
        username: 'test1',
        avatarUrl: 'URL',
        role: Role.admin,
      );

      final UserDataModel result = UserDataModel.fromMap(userDataMap);

      expect(result, userDataModel);
    });

    test('factory_from_Json', () {
      const String userDataJson = '{"id": 1,"attributes":{"username": "test1","role": "admin","createdAt": "2023-08-16T12:51:18.834Z","updatedAt": "2023-08-16T12:52:13.231Z","publishedAt": "2023-08-16T12:51:57.388Z","avatarUrl": "URL",},};';

      final UserDataModel userDataModel = UserDataModel(
        id: 1,
        username: 'test1',
        avatarUrl: 'URL',
        role: Role.admin,
      );

      final UserDataModel result = UserDataModel.fromJson(userDataJson);

      expect(result, userDataModel);
    });
    group('method_copy_with', () {
      test('method_copy_with_with_arguments', () {
        final UserDataModel userDataModel1 = UserDataModel(
          id: 2314523452,
          username: 'wqer',
          avatarUrl: 'werqwerqwer',
          role: Role.admin,
        );

        final UserDataModel userDataModel2 = UserDataModel(
          id: 2,
          username: 'test2',
          avatarUrl: 'URL',
          role: Role.user,
        );

        final UserDataModel result = userDataModel1.copyWith(
          id: 2,
          username: 'test2',
          avatarUrl: 'URL',
          role: Role.user,
        );

        expect(result, userDataModel2);
      });
      test('method_copy_with_without_any _arguments', () {
        final UserDataModel userDataModel1 = UserDataModel(
          id: 0,
          username: '321321',
          avatarUrl: '123443',
          role: Role.user,
        );

        final UserDataModel userDataModel2 = UserDataModel(
          id: 0,
          username: '',
          avatarUrl: '',
          role: Role.user,
        );

        UserDataModel result = userDataModel1.copyWith(
          username: '',
          avatarUrl: '',
        );

        expect(result, userDataModel2);
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

    final UserDataModel userDataModel = UserDataModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final Map<String, dynamic> result = userDataModel.toMap();

    expect(result, userDataMap);
  });
  test('method_to_Json', () {
    final UserDataModel userDataModelTest = UserDataModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final Map<String, dynamic> dataMap = userDataModelTest.toMap();
    final String userDataJson = json.encode(dataMap);

    final UserDataModel userDataModel = UserDataModel(
      id: 1,
      username: 'test1',
      avatarUrl: 'URL',
      role: Role.admin,
    );

    final String result = userDataModel.toJson();

    expect(result, userDataJson);
  });
}
