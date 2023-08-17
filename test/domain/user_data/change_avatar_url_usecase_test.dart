import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';

@GenerateNiceMocks([MockSpec<UserDataServerRepository>()])
import 'change_avatar_url_usecase_test.mocks.dart';

void main() {
  final UserData userData = UserData(
    id: 1,
    username: 'Pencil',
    avatarUrl: 'avatarUrl',
    role: Role.user,
  );

  final String newAvatarUrl = 'newAvatarUrl';

  final ChangeAvatarUrlUseCaseParams changeAvatarUrlUseCaseParams = ChangeAvatarUrlUseCaseParams(
    userData,
    newAvatarUrl,
  );

  test('change_avatar_url_usecase_test', () async {
    // Act.
    final UserDataServerRepository userDataServerRepository = MockUserDataServerRepository();
    when(userDataServerRepository.changeAvatarUrl(
      userData: userData,
      newAvatarUrl: newAvatarUrl,
    )).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final changeAvatarUrl = ChangeAvatarUrlUseCase();
    final Either<Failure, UserData> result = await changeAvatarUrl.call(changeAvatarUrlUseCaseParams);

    // Accert.
    verify(userDataServerRepository.changeAvatarUrl(
      userData: userData,
      newAvatarUrl: newAvatarUrl,
    )).called(1);
    verifyNoMoreInteractions(userDataServerRepository);
    expect(result, Right(userData));
  });
}
