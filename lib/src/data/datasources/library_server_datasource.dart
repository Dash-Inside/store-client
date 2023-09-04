//ignore_for_file: avoid-ignoring-return-values

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/models/favorite_topics_model.dart';
import 'package:store_client/src/data/models/section_model.dart';
import 'package:store_client/src/data/models/topic_model.dart';
import 'package:store_client/src/data/utils/status_code_handler.dart';

@Injectable()
class LibraryServerDatasource {
  final DioModule dioModule;
  final String _favoritUri = 'http://192.168.1.42:1337/api/favorites';
  final String _sectiontUri = 'http://127.0.0.1:1337/api/sections';
  final String _topictUri = 'http://127.0.0.1:1337/api/topics';

  LibraryServerDatasource(this.dioModule);

  Future<List<FavoriteTopicsModel>> getAllFavoriteTopic() async {
    try {
      final Response response = await dioModule.client.get(_favoritUri);

      StatusCodeHandler.check(response.statusCode.toString());

      List listData = response.data['data'];
      List<FavoriteTopicsModel> list = [];

      listData.forEach((element) {
        list.add(FavoriteTopicsModel.fromMap(element));
      });

      return list;
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> cleanFavoriteTopic() async {
    //подумать
    //я того рот ебал не понимаю нихуя что где почему для чего 
    
    try {
      final Response responseGetAllTopics = await dioModule.client.get(_favoritUri);

      StatusCodeHandler.check(responseGetAllTopics.statusCode.toString());

      List listData = responseGetAllTopics.data['data'];

      listData.forEach((element) {
        dioModule.client.delete(_favoritUri + '/${element['id']}');
      });

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<FavoriteTopicsModel> addFavoritTopic({required int id}) async {
    try {
      final Response response = await dioModule.client.post(
        _favoritUri,
        data: jsonEncode(<String, dynamic>{
          'data': {
            'userID': 1,
            'topicID': id,
          },
        }),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      return FavoriteTopicsModel.fromMap(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> addTopic({
    required String title,
    required String data,
    required List<String> links,
  }) async {
    try {
      final Response response = await dioModule.client.post(_topictUri, data: <String, dynamic>{
        'data': {
          'title': title,
          'data': data,
          'links': links.join(';'),
        },
      });

      StatusCodeHandler.check(response.statusCode.toString());

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<SectionModel>> getAllSection() async {
    try {
      final Response response = await dioModule.client.get(_sectiontUri);

      StatusCodeHandler.check(response.statusCode.toString());

      final List listMap = response.data['data'];
      final List<SectionModel> result = [];

      listMap.forEach((element) {
        result.add(SectionModel.fromMap(element as Map<String, dynamic>));
      });

      return result;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<int>> getAllTopicsIdBySectionId({required int sectionId}) async {
    try {
      final Response response = await dioModule.client.get(_sectiontUri + '/$sectionId');

      StatusCodeHandler.check(response.statusCode.toString());

      final List<int> result = [];
      result.add(response.data['data']['attributes']['topicID'] as int);

      return result;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TopicModel>> getAllTopicByListId({required List<int> listTopicsId}) async {
    try {
      Map<String, dynamic> filters = {};

      for (int i = 0; i < listTopicsId.length; i++) {
        filters['filters[id][\$in][$i]'] = listTopicsId[i];
      }

      final Response response = await dioModule.client.get(_topictUri, queryParameters: filters);

      StatusCodeHandler.check(response.statusCode.toString());

      final List listMap = response.data['data'];
      final List<TopicModel> result = [];

      listMap.forEach((element) {
        result.add(TopicModel.fromMap(element as Map<String, dynamic>));
      });

      return result;
    } catch (_) {
      rethrow;
    }
  }

  Future<TopicModel> getTopicDataByID({required int topicId}) async {
    try {
      final Response response = await dioModule.client.get(_topictUri + '/$topicId');

      StatusCodeHandler.check(response.statusCode.toString());

      return TopicModel.fromMap(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> removeFavoriteTopic({required int favoriteId}) async {
    try {
      final Response response = await dioModule.client.delete(_favoritUri + '/$favoriteId');

      StatusCodeHandler.check(response.statusCode.toString());

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TopicModel>> searchTopicByTitle({required String topicTitle}) async {
    try {
      final Response response = await dioModule.client.get(_topictUri, queryParameters: {'filters[title][\$contains]': topicTitle});

      StatusCodeHandler.check(response.statusCode.toString());

      final List listMap = response.data['data'];
      final List<TopicModel> result = [];

      listMap.forEach((element) {
        result.add(TopicModel.fromMap(element as Map<String, dynamic>));
      });

      return result;
    } catch (_) {
      rethrow;
    }
  }
}
