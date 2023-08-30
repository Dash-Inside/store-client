// ignore_for_file: avoid-top-level-members-in-tests, prefer-static-class, avoid-dynamic

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/entities/actions/add_topic_action_params.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../../mock/repositories.mocks.dart';

const int correctId = 1;
const int incorrectId = -3;

final Topic correctTopic = Topic(
  id: 1,
  title: 'title',
  data: 'data',
  links: <String>['links', 'links'],
);

final Topic incorrectTopic = Topic(
  id: 1,
  title: '',
  data: '',
  links: [''],
);

final AddTopicActionParams correctTopicParams = AddTopicActionParams(
  title: 'title',
  data: 'data',
  links: <String>['links', 'links'],
);

final AddTopicActionParams incorrectTopicParams = AddTopicActionParams(
  title: '',
  data: '',
  links: <String>[''],
);

const String correctTitle = 'test';

const String incorrectTitle = '';

MockLibraryRepository arrangeMockLibraryRepository() {
  final mock = MockLibraryRepository();

  when(
    mock.addFavoriteTopic(id: correctId),
  ).thenAnswer(
    (_) async => Right(unit),
  );

  when(
    mock.addFavoriteTopic(id: incorrectId),
  ).thenAnswer(
    (_) async => Left(IncorrectTopicIdFailure(StackTrace.empty)),
  );

  when(
    mock.addTopic(addTopicActionParams: correctTopicParams),
  ).thenAnswer(
    (realInvocation) async => Right(unit),
  );

  when(
    mock.addTopic(addTopicActionParams: incorrectTopicParams),
  ).thenAnswer(
    (realInvocation) async => Left(IncorrectTopicParamsFailure(StackTrace.empty)),
  );

  when(
    mock.getAllSections(),
  ).thenAnswer(
    (_) async => Right([Section(id: 1, title: 'title', topicId: 1)]),
  );

  when(
    mock.getAllTopicsBySectionID(id: correctId),
  ).thenAnswer(
    (_) async => Right([correctTopic]),
  );

  when(
    mock.getAllTopicsBySectionID(id: incorrectId),
  ).thenAnswer(
    (_) async => Left(IncorrectSectionIdFailure(StackTrace.empty)),
  );

  when(
    mock.getTopicDataByID(id: correctId),
  ).thenAnswer(
    (_) async => Right(correctTopic),
  );

  when(
    mock.getTopicDataByID(id: incorrectId),
  ).thenAnswer(
    (_) async => Left(IncorrectTopicIdFailure(StackTrace.empty)),
  );

  when(
    mock.removeFavoriteTopic(id: correctId),
  ).thenAnswer(
    (_) async => Right(unit),
  );

  when(
    mock.removeFavoriteTopic(id: incorrectId),
  ).thenAnswer(
    (_) async => Left(IncorrectFavoriteIdFailure(StackTrace.empty)),
  );

  when(
    mock.searchTopicByTitle(title: correctTitle),
  ).thenAnswer(
    (_) async => Right([correctTopic]),
  );

  when(
    mock.searchTopicByTitle(title: incorrectTitle),
  ).thenAnswer(
    (_) async => Left(IncorrectTopicTitleFailure(StackTrace.empty)),
  );

  return mock;
}
