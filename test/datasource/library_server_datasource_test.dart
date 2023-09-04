import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/library_server_datasource.dart';
import 'package:store_client/src/data/models/favorite_topics_model.dart';

import '../services/services.dart';

Future<void> main() async {
  await initMockService();

  final LibraryServerDatasource libraryServerDatasource = services<LibraryServerDatasource>();

  group('Clean datasporce test', () {
    test('Correct test clean Favorite Topic', () async {
      //Act

      //Arrange
      await libraryServerDatasource.cleanFavoriteTopic();

      final List<FavoriteTopicsModel> list = await libraryServerDatasource.getAllFavoriteTopic();
      //Arrange
      expect(list, []);
    });
  });

  group('Add test Datasource', () {
    test('Correct add test', () async {
      Future<void> Function() clean = () async => await libraryServerDatasource.cleanFavoriteTopic();
      Future<FavoriteTopicsModel> Function() addfavoriteTopicsModel = () async => await libraryServerDatasource.addFavoritTopic(id: 1);

      Future<List<dynamic>> list = Future.wait([clean(), addfavoriteTopicsModel()]);
      list.then((value) {
        FavoriteTopicsModel favoriteTopicsModel = value[1] as FavoriteTopicsModel;

        expect(
          favoriteTopicsModel,
          FavoriteTopicsModel(favoritTopicId: favoriteTopicsModel.favoritTopicId, userID: 1, topicID: 1),
        );
      })
        ..onError((error, stackTrace) {
          throw Error();
        });
    });

    // test('Icorrect add test', () async {
    //   final Future<FavoriteTopicsModel?> Function() addfavoriteTopicsModel = () async => await libraryServerDatasource.addFavoritTopic(id: -1);

    //   late FavoriteTopicsModel? resultOrNull;

    //   try {
    //     resultOrNull = await addfavoriteTopicsModel();
    //   } catch (_) {
    //     resultOrNull = null;
    //   }

    //   expect(resultOrNull, null);
    // });
  });
}
