import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/topic_model.dart';

void main() {
  const int id = 1;
  const String title = "title";
  const String data = "data";
  const List<String>? links = ['abc'];

  final TopicModel topicModel = TopicModel(
    id: id,
    title: title,
    data: data,
    links: links,
  );
  final Map<String, dynamic> topicMap = {
    "id": id,
    "attributes": {
      "title": "title",
      "data": "data",
      "links": "abc",
      "createdAt": "2023-08-16T13:35:55.840Z",
      "updatedAt": "2023-08-16T13:36:04.409Z",
      "publishedAt": "2023-08-16T13:36:04.407Z",
    },
  };
  const Map<String, dynamic> mapRes = {
    "id": 1,
    "title": "title",
    "data": "data",
    "links": "abc",
  };
  group(
    'test for topicModel',
    () {
      test(
        'test for fromMap',
        () {
          final TopicModel result = TopicModel.fromMap(topicMap);
          print(result.hashCode);
          print(topicModel.hashCode);
          print(result);
          print(topicModel);
          expect(result, topicModel);
        },
      );

      test(
        'copyWith without params',
        () {
          final TopicModel topicModelresult = topicModel.copyWith();
          expect(topicModelresult, topicModel);
        },
      );
      test(
        'copyWith with params',
        () {
          final TopicModel topicModelResult = topicModel.copyWith(
            id: 1,
            title: 'title',
            data: 'data',
            links: ['abc'],
          );
          final TopicModel result = TopicModel(
            id: 1,
            title: 'title',
            data: 'data',
            links: ['abc'],
          );
          print(topicModelResult.hashCode);
          print(topicModel.hashCode);
          print(result.hashCode);
          expect(topicModelResult, topicModel);
        },
      );
      test(
        'test for fromJson',
        () {
          const String source =
              '{"id": 1,"attributes": {"title" : "title","data" : "data","links" : "abc","createdAt" : "2023-08-16T13:35:55.840Z","updatedAt" : "2023-08-16T13:36:04.409Z","publishedAt" : "2023-08-16T13:36:04.407Z"}}';
          final TopicModel result = TopicModel.fromJson(source);
          expect(result, topicModel);
        },
      );
      test(
        'toMap',
        () {
          final Map<String, dynamic> result = topicModel.toMap();
          expect(result, mapRes);
        },
      );
      test(
        'toJson',
        () {
          final Map<String, dynamic> map = topicModel.toMap();
          final String topicJson = json.encode(map);
          final String result = topicModel.toJson();
          expect(result, topicJson);
        },
      );
    },
  );
}
