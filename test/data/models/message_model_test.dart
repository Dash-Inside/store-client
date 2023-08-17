import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/message_model.dart';

void main() {
  const int id = 1;
  const String data = 'test_data';
  const int senderId = 3;
  const Map<String, dynamic> messageMap = {
    "id": 1,
    "attributes": {
      "data": "test_data",
      "createdAt": "2023-08-16T14:11:51.455Z",
      "updatedAt": "2023-08-16T14:11:54.335Z",
      "publishedAt": "2023-08-16T14:11:54.326Z",
      "senderID": 3,
    },
  };
  final MessageModel messageModel = MessageModel(
    id: id,
    data: data,
    senderId: senderId,
  );
  group(
    "test for MessadgeModel",
    () {
      test(
        'test for fromMap',
        () {
          final MessageModel result = MessageModel.fromMap(messageMap);

          expect(result, messageModel);
        },
      );
      group(
        "method copyWith",
        () {
          test(
            'copyWith without params',
            () {
              final MessageModel messageModelresult = messageModel.copyWith();

              expect(messageModelresult, messageModel);
            },
          );

          test(
            'copyWith with paramas',
            () {
              MessageModel messageModelresult = messageModel.copyWith(id: 2, data: 'data', senderId: 3);
              MessageModel result = MessageModel(id: 2, data: 'data', senderId: 4);
              expect(messageModelresult, result);
            },
          );
        },
      );

      test(
        'test for fromJson',
        () {
          const String dataMes =
              '{"id": 1,"attributes": {"data": "test_data","createdAt": "2023-08-16T14:11:51.455Z","updatedAt": "2023-08-16T14:11:54.335Z","publishedAt": "2023-08-16T14:11:54.326Z","senderID": 3}}';

          final MessageModel result = MessageModel.fromJson(dataMes);

          expect(result, messageModel);
        },
      );

      test(
        'test toMap',
        () {
          final Map<String, dynamic> result = messageModel.toMap();
          expect(result, messageMap);
        },
      );

      test(
        'toJson',
        () {
          final String result = messageModel.toJson();

          expect(result, messageMap);
        },
      );
    },
  );
}
