import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/message_model.dart';

Future<void> main() async {
  const int senderIDTest = 3;

  group("methods MessageModel test", () {
    group("method fromMap test", () {
      test("correct test", () {
        // Act.
        final Map<String, dynamic> correctMap = {
          "id": 1,
          "attributes": {
            "data": "data",
            "senderID": 3,
          },
        };

        // Arrange.

        final MessageModel? Function() result = () {
          try {
            return MessageModel.fromMap(correctMap);
          } catch (_) {
            return null;
          }
        };

        // Assert.
        expect(result(), MessageModel(id: 1, data: 'data', senderId: senderIDTest));
      });

      test("incorrect test", () async {
        // Act.
        final Map<String, dynamic> incorrectMap = {
          "id": 1,
          "attributes": {
            "data": "data",
          },
        };

        // Arrange.
        final MessageModel? Function() result = () {
          try {
            return MessageModel.fromMap(incorrectMap);
          } catch (_) {
            return null;
          }
        };

        // Assert.
        expect(result(), null);
      });
    });
    group('method fromJson test', () {
      test('correct test', () async {
        // Act.
        final File file = File('test/artifacts/message_model_artifact/correct_message_model_test.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final MessageModel? Function() result = () {
          try {
            return MessageModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // Assert.
        expect(result(), MessageModel(id: 1, data: 'data', senderId: senderIDTest));
      });

      test('incorrect test', () async {
        // Act.
        final File file = File('test/artifacts/message_model_artifact/incorrect_message_model_test.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final MessageModel? Function() result = () {
          try {
            return MessageModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // Assert.
        expect(result(), null);
      });
    });

    group('method toMap test', () {
      test('correct test', () {
        // Act.
        final Map<String, dynamic> correctMap = {
          'id': 1,
          'data': {
            'data': 'data',
            'senderId': 3,
          },
        };

        final MessageModel messageModel = MessageModel(id: 1, data: 'data', senderId: senderIDTest);

        // Arrange.
        final Map<String, dynamic> result = messageModel.toMap();

        // Assert.
        expect(result, correctMap);
      });
    });
    group('method toJson test', () {
      test('correct test', () {
        // Act.
        final String correctJSON = jsonEncode({
          "id": 1,
          "data": {"data": "data", "senderId": 3},
        });

        final MessageModel messageModel = MessageModel(id: 1, data: 'data', senderId: senderIDTest);

        // Arrange.
        final String result = messageModel.toJson();

        // Assert.
        expect(result, correctJSON);
      });
    });
    group('method copyWith test', () {
      test('correct test', () {
        // Act.
        final MessageModel messageModel = MessageModel(id: 1, data: 'data', senderId: senderIDTest);
        final MessageModel correctMessageModel = MessageModel(id: 1, data: 'Djavid Don', senderId: 666);

        // Arrange.
        final MessageModel result = messageModel.copyWith(id: 1, data: 'Djavid Don', senderId: 666);

        // Accert.
        expect(result, correctMessageModel);
      });
    });
  });
}
