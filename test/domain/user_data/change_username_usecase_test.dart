import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart';

@GenerateNiceMocks([MockSpec<UserDataServerRepository>()])
import 'change_username_usecase_test.mocks.dart';

void main() {
  UserData userData = UserData(
    id: 1,
    username: 'Pencil',
    avatarUrl: 'avatarUrl',
    role: Role.user,
  );

  final String newUserName = 'newUserName';

  ChangeUserNameUseCaseParams changeUserNameUseCaseParams = ChangeUserNameUseCaseParams(userData, newUserName);

  test('change_username_usecase_test', () async {
    // Act.
    UserDataServerRepository userDataServerRepository = MockUserDataServerRepository();
    when(userDataServerRepository.changeUserName(userData: userData, newUserName: newUserName)).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final changeUserName = ChangeUserNameUseCase();
    final result = await changeUserName.call(changeUserNameUseCaseParams);
    // Accert.
    verifyNoMoreInteractions(UserDataServerRepository);
    verify(userDataServerRepository.changeUserName(userData: userData, newUserName: newUserName)).called(1);
    expect(result, Right(userData));
  });
}
