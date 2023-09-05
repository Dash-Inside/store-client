import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/failure/user_data_failure.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart';

import '../../../injector/arrange/mock_user_data_repo.dart';
import '../../../injector/services.dart';

final ChangeAvatarUrlUseCaseParams changeAvatarUrlUseCaseParams = ChangeAvatarUrlUseCaseParams(
  user,
  newAvatarUrl,
);

final ChangeAvatarUrlUseCaseParams incorrectChangeAvatarUrlUseCaseParams = ChangeAvatarUrlUseCaseParams(
  user,
  incorrectAvatarUrl,
);

final ChangeUserNameUseCaseParams changeUserNameUseCaseParams = ChangeUserNameUseCaseParams(
  user,
  newUserName,
);

final ChangeUserNameUseCaseParams incorrectChangeUserNameUseCaseParams = ChangeUserNameUseCaseParams(
  user,
  incorrectUserName,
);

void main() async {
  await initMockServicesTest();
  await initUseCaseServicesTest();
  group('ChangeUserName usecase test', () {
    test('correct test', () async {
      //Act.
      final UserRepository userRepository = services<UserRepository>();
      final ChangeUserNameUseCase changeUserNameUseCase = services<ChangeUserNameUseCase>();

      //Arrange.
      final Either<Failure, User> failOrAvatar = await changeUserNameUseCase.call(
        changeUserNameUseCaseParams,
      );

      //Accert.
      expect(failOrAvatar.isRight(), true);
      verify(userRepository.changeUserName(user: user, newUserName: newUserName)).called(1);
      verifyNoMoreInteractions(userRepository);
    });

    test('incorrect test', () async {
      //Act.
      final UserRepository userRepository = services<UserRepository>();
      final ChangeUserNameUseCase changeUserNameUseCase = services<ChangeUserNameUseCase>();

      //Arrange.
      final Either<Failure, User> failOrAvatar = await changeUserNameUseCase.call(incorrectChangeUserNameUseCaseParams);
      final bool result = failOrAvatar.fold(
        (l) => l is NotValidChangeUserNameFailure,
        (r) => false,
      );
      //Accert.
      expect(result, true);
      verifyNoMoreInteractions(userRepository);
    });
  });
}
