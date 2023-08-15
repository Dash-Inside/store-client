//ignore_for_file: unused_import

import 'package:mockito/annotations.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

@GenerateNiceMocks([MockSpec<LibraryRepository>()])
@GenerateNiceMocks([MockSpec<MessengerRepository>()])
@GenerateNiceMocks([MockSpec<UserDataRepository>()])
import 'test_repositories.mocks.dart';
