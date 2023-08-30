// ignore_for_file: avoid-top-level-members-in-tests, prefer-static-class, avoid-redundant-async

import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_favorite_topic_usecase.dart';
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart';
import 'package:store_client/src/domain/usecases/library/get_all_sections_usecase.dart';
import 'package:store_client/src/domain/usecases/library/get_all_topics_by_section_id_usecase.dart';
import 'package:store_client/src/domain/usecases/library/get_topic_by_id_usecase.dart';
import 'package:store_client/src/domain/usecases/library/remove_favorite_topic_usecase.dart';
import 'package:store_client/src/domain/usecases/library/search_topic_by_title_usecase.dart';

import 'arrange/mock_library_repository.dart';

FutureOr<void> initMockService() async {
  // Repository
  services.registerLazySingleton<LibraryRepository>(() => arrangeMockLibraryRepository());

  // Use Case
  services.registerLazySingleton<AddFavoriteTopicUseCase>(() => AddFavoriteTopicUseCase());

  services.registerLazySingleton<AddTopicUseCase>(() => AddTopicUseCase());

  services.registerLazySingleton<GetAllSectionsUseCase>(() => GetAllSectionsUseCase());

  services.registerLazySingleton<GetAllTopicsBySectionIDUseCase>(() => GetAllTopicsBySectionIDUseCase());

  services.registerLazySingleton<GetTopicByIDUseCase>(() => GetTopicByIDUseCase());

  services.registerLazySingleton<RemoveFavoriteTopicUseCase>(() => RemoveFavoriteTopicUseCase());

  services.registerLazySingleton<SearchTopicByTitleUseCase>(() => SearchTopicByTitleUseCase());
}
