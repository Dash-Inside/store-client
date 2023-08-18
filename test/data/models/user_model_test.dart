import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/user_model.dart';

void main() {
  const int id = 1;
  const String userName = "userName";
  const String email = "email@email.com";

  final UserModel userModel = UserModel(
    id: id,
    userName: userName,
    email: email,
  );

  final Map<String, dynamic> map = {
    "id": 1,
    "username": "userName",
    "email": "email@email.com",
  };
  final Map<String, dynamic> mapRes = {
    "id": 1,
    "userName": "userName",
    "email": "email@email.com",
  };

  group(
    'Test for UserModel method',
    () {
      test(
        "fromMap",
        () {
          final UserModel result = UserModel.fromMap(map);

          expect(result, userModel);
        },
      );
      test(
        'copyWith without params',
        () {
          final UserModel userModelResult = userModel.copyWith();
          expect(userModelResult, userModel);
        },
      );
      test(
        'copyWith with params',
        () {
          final UserModel userModelresult = userModel.copyWith(
            id: 3,
            userName: userName,
            email: email,
          );
          final UserModel result = UserModel(
            id: 3,
            userName: userName,
            email: email,
          );
          expect(userModelresult, result);
        },
      );
      test(
        'fromJson',
        () {
          const String dataMes = '{"id": 1,"username": "userName","email": "email@email.com"}';

          final UserModel result = UserModel.fromJson(dataMes);

          expect(result, userModel);
        },
      );
      test(
        'toMap',
        () {
          final Map<String, dynamic> result = userModel.toMap();

          expect(result, mapRes);
        },
      );
      test(
        'toJson',
        () {
          final Map<String, dynamic> map = userModel.toMap();
          final String userJson = json.encode(map);
          final String result = userModel.toJson();

          expect(result, userJson);
        },
      );
    },
  );
}
