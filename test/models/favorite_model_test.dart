//ignore_for_file:avoid-dynamic

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/favorite_topics_model.dart';

void main() {
  group('Favorite Model', () {
    group('fromJson', () {
      test('correct test', () async {
        // act
        final File file = File('test/artifacts/correct_favorite_topic_response.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String jsonString = await file.readAsString();
        final dynamic jsonValue = jsonDecode(jsonString);
        final dynamic jsonData = jsonEncode(jsonValue['data']);

        // arrange
        // final FavoriteTopicsModel model = FavoriteTopicsModel.fromJson(jsonData);
        final FavoriteTopicsModel? Function() datasource = () {
          try {
            return FavoriteTopicsModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // assert
        // expect(model, FavoriteTopicsModel(userID: 1, topicID: 1));
        expect(datasource(), FavoriteTopicsModel(userID: 1, topicID: 1));
      });

      test('incorrect test', () async {
        // act
        final File file = File('test/artifacts/incorrect_favorite_topic_response.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String jsonString = await file.readAsString();
        final dynamic jsonValue = jsonDecode(jsonString);
        final dynamic jsonData = jsonEncode(jsonValue['data']);

        // arrange
        // final FavoriteTopicsModel model = FavoriteTopicsModel.fromJson(jsonData);
        final FavoriteTopicsModel? Function() datasource = () {
          try {
            return FavoriteTopicsModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // assert
        // expect(model, FavoriteTopicsModel(userID: 1, topicID: 1));
        expect(datasource(), null);
      });
    });

    group('fromMap', () {
      test('correct test', () {
        // act
        final Map<String, dynamic> correctData = {
          "id": 1,
          "attributes": {
            "userID": 1,
            "topicID": 1,
          },
        };

        // arrange
        final FavoriteTopicsModel? Function() datasource = () {
          try {
            return FavoriteTopicsModel.fromMap(correctData);
          } catch (_) {
            return null;
          }
        };

        expect(datasource(), FavoriteTopicsModel(userID: 1, topicID: 1));
      });

      test('incorrect test', () {
        // act
        final Map<String, dynamic> incorrectData = {
          "id": 1,
          "attributes": {
            "userID": 1,
          },
        };

        // arrange
        final FavoriteTopicsModel? Function() datasource = () {
          try {
            return FavoriteTopicsModel.fromMap(incorrectData);
          } catch (_) {
            return null;
          }
        };

        expect(datasource(), null);
      });
    });

    test('toMap test', () {
      // act
      FavoriteTopicsModel model = FavoriteTopicsModel(userID: 1, topicID: 1);
      final Map<String, dynamic> correctData = {
        "id": 1,
        "data": {
          "userID": 1,
          "topicID": 1,
        },
      };

      // arrange
      Map<String, dynamic> data = model.toMap();

      // assert
      expect(data, correctData);
    });

    test('toJson test', () {
      // act
      FavoriteTopicsModel model = FavoriteTopicsModel(userID: 1, topicID: 1);
      String correctData = jsonEncode({
        "id": 1,
        "data": {
          "userID": 1,
          "topicID": 1,
        },
      });

      // arrange
      final String data = model.toJson();

      // assert
      expect(data, correctData);
    });
  });
}
