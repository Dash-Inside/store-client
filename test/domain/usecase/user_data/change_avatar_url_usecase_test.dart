import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/failure/user_data_failure.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/domain/usecases/messenger/send_message_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';

import '../../../injector/arrange/mock_user_data_repo.dart';
import '../../../injector/services.dart';

// const String newAvatarUrl =
//     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.canva.com%2Fru_ru%2Fobuchenie%2Fidei-dlya-foto%2F&psig=AOvVaw27kpS7isvaEMvZZ3m2S_oR&ust=1693492310569000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCLClvM_MhIEDFQAAAAAdAAAAABAE';

// const String incorrectAvatarUrl = '';

final ChangeAvatarUrlUseCaseParams changeAvatarUrlUseCaseParams = ChangeAvatarUrlUseCaseParams(
  user,
  newAvatarUrl,
);

final ChangeAvatarUrlUseCaseParams incorrectChangeAvatarUrlUseCaseParams = ChangeAvatarUrlUseCaseParams(
  user,
  incorrectAvatarUrl,
);
void main() async {
  await initMockServices();
  await initUseCaseServices();
  group('ChangeAvatarUrl usecase test', () {
    test('correct test', () async {
      //Act.
      final UserRepository userRepository = services<UserRepository>();
      final ChangeAvatarUrlUseCase changeAvatarUrlUseCase = services<ChangeAvatarUrlUseCase>();

      //Arrange.
      final Either<Failure, User> failOrAvatar = await changeAvatarUrlUseCase.call(
        changeAvatarUrlUseCaseParams,
      );

      //Accert.
      expect(failOrAvatar.isRight(), true);
      verify(userRepository.changeAvatarUrl(user: user, newAvatarUrl: newAvatarUrl)).called(1);
      verifyNoMoreInteractions(userRepository);
    });

    test('incorrect test', () async {
      //Act.
      final UserRepository userRepository = services<UserRepository>();
      final ChangeAvatarUrlUseCase changeAvatarUrlUseCase = services<ChangeAvatarUrlUseCase>();

      //Arrange.
      final Either<Failure, User> failOrAvatar = await changeAvatarUrlUseCase.call(incorrectChangeAvatarUrlUseCaseParams);
      final bool result = failOrAvatar.fold(
        (l) => l is NotValidChangeAvatarUrlFailure,
        (r) => false,
      );
      //Accert.
      expect(result, true);
      verifyNoMoreInteractions(userRepository);
    });
  });
}
