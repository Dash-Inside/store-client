import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';

import '../../injector/services.dart';

Future<void> main() async {
  await initTestServices();
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
    final UserDataRepository userDataRepository = testServices.get<UserDataRepository>();
    when(userDataRepository.changeAvatarUrl(
      userData: userData,
      newAvatarUrl: newAvatarUrl,
    )).thenAnswer((_) async {
      return Right(userData);
    });

    // Arrange.
    final ChangeAvatarUrlUseCase changeAvatarUrl = ChangeAvatarUrlUseCase();
    final Either<Failure, UserData> result = await changeAvatarUrl.call(changeAvatarUrlUseCaseParams);

    // Accert.
    verify(userDataRepository.changeAvatarUrl(
      userData: userData,
      newAvatarUrl: newAvatarUrl,
    )).called(1);
    verifyNoMoreInteractions(userDataRepository);
    expect(result, Right(userData));
  });
}
