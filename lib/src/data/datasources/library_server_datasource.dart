import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/models/favorite_topics_model.dart';
import 'package:store_client/src/data/models/topic_model.dart';
import 'package:store_client/src/data/utils/status_code_handler.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';

@Injectable()
class LibraryServerDatasource {
  final DioModule dioModule;
  final String _favoritUri = 'http://192.168.1.43:1337/api/favorites';
  final String _sectiontUri = 'http://192.168.1.43:1337/api/sections';
  final String _topictUri = 'http://192.168.1.43:1337/api/topics';

  LibraryServerDatasource(this.dioModule);

  Future<Unit> addFavoritTopicDatasource({required int id}) async {
    try {
      FavoriteTopicsModel favoriteTopicModel = FavoriteTopicsModel(userID: 1, topicID: id);

      Response response = await dioModule.client.post(
        _favoritUri,
        data: favoriteTopicModel.toMap(),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> addTopicDatasouce({
    required String title,
    required String data,
    required List<String> links,
  }) async {
    try {
      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Section>> getAllSectionDatasource() async {
    try {
      return [];
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Topic>> getAllTopicsBySectionIDDatasource({required int id}) async {
    try {
      return [];
    } catch (_) {
      rethrow;
    }
  }

  Future<Topic> getTopicDataByIDDatasource({required int id}) async {
    try {
      final Response response = await dioModule.client.get(_topictUri + '/$id');

      StatusCodeHandler.check(response.statusCode.toString());

      TopicModel topicModel = TopicModel.fromMap(response.data['data']);

      return Topic(
        id: topicModel.id,
        title: topicModel.title,
        data: topicModel.data,
        links: topicModel.links,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> removeFavoriteTopicDatasource({required int id}) async {
    try {
      final Response response = await dioModule.client.delete(_favoritUri + '/$id');

      StatusCodeHandler.check(response.statusCode.toString());

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<Topic> searchTopicByTitleDatasource({required String title}) async {
    try {
      return Topic(id: 1, title: "title", data: "data", links: ["links"]);
    } catch (_) {
      rethrow;
    }
  }
}
