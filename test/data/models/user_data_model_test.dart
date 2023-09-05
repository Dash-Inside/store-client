// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/entities/role.dart';

Future<void> main() async {
  const int idTest = 2;
  group("Test method for UserModel", () {
    group("fromJson", () {
      test("correct test", () async {
        // Act.
        final File file = File('test/artifacts/user_model_artifact/correct_user_model_test.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final UserModel? Function() result = () {
          try {
            return UserModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };
        // Assert.
        expect(
          result(),
          UserModel(
            id: idTest,
            email: "email@email.com",
            username: "username",
            avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
            role: Role.Public,
          ),
        );
      });
      test("incorrect test", () async {
        // Act.
        final File file = File('test/artifacts/user_model_artifact/incorrect_user_model_test.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final UserModel? Function() result = () {
          try {
            return UserModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };
        // Assert.
        expect(result(), null);
      });
    });
    group("fromMap", () {
      test("correct test", () async {
        // Act.
        final Map<String, dynamic> correctData = {
          "id": 2,
          "attributes": {
            "username": "test",
            "role": "Role.public",
            "email": "email@email.com",
            "avatarUrl": "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
          },
        };
        // Arrange.
        final UserModel? Function() result = () {
          try {
            return UserModel.fromMap(correctData);
          } catch (_) {
            return null;
          }
        };
        // Assert.
        expect(
          result(),
          UserModel(
            id: idTest,
            email: "email@email.com",
            username: "test",
            avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
            role: Role.Public,
          ),
        );
      });
      test("incorrect test", () async {
        // Act.
        final Map<String, dynamic> incorrectData = {
          "id": 2,
          "attributes": {
            "role": "Role.public",
            "email": "email@email.com",
            "avatarUrl": "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
          },
        };
        // Arrange.
        final UserModel? Function() result = () {
          try {
            return UserModel.fromMap(incorrectData);
          } catch (_) {
            return null;
          }
        };
        // Assert.
        expect(result(), null);
      });
    });
    test("toMap correct test", () {
      UserModel userModel = UserModel(
        id: idTest,
        email: "email@email.com",
        username: "test",
        avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
        role: Role.Public,
      );
      final Map<String, dynamic> correctData = {
        "id": 2,
        "username": "test",
        "role": "Public",
        "email": "email@email.com",
        "avatarUrl": "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
      };

      final Map<String, dynamic> result = userModel.toMap();

      expect(result, correctData);
    });
    test("toJson correct test", () {
      UserModel userModel = UserModel(
        id: idTest,
        email: "email@email.com",
        username: "test",
        avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
        role: Role.Public,
      );
      final String correctData = jsonEncode({
        "id": 2,
        "email": "email@email.com",
        "username": "test",
        "avatarUrl": "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
        "role": "Public",
      });

      final String result = userModel.toJson();

      expect(result, correctData);
    });
    test("CopyWith correct test", () async {
      // Act.
      UserModel userModel = UserModel(
        id: idTest,
        email: "email@email.com",
        username: "test",
        avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
        role: Role.Public,
      );
      final UserModel correctData = UserModel(
        id: idTest,
        email: "email",
        username: "test",
        avatarUrl: "http://localhost:1337/uploads/fitness_free_app_ui_kit_for_figma_5f4cc12078.jpg",
        role: Role.Public,
      );

      // Arrange.
      final UserModel? Function() result = () {
        try {
          return userModel.copyWith(email: 'email');
        } catch (_) {
          return null;
        }
      };

      // Assert.
      expect(result(), correctData);
    });
  });
}
