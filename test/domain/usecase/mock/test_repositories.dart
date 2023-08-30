import 'package:mockito/annotations.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

@GenerateNiceMocks([MockSpec<MessengerRepository>(), MockSpec<LibraryRepository>(), MockSpec<UserRepository>()])
import 'test_repositories.mocks.dart';
