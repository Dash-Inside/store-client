// ignore_for_file: prefer-static-class,avoid-top-level-members-in-tests
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../../domain/usecase/mock/test_repositories.mocks.dart';

//! for 1 'when' correct ChangeAvatarUrl
const String newAvatarUrl = 'newAvatarUrl';
const int userId = 1;
const String userEmail = 'email@email.com';
const String userUsername = 'syka';
const String userAvatarUrl = 'syka';
const Role userRole = Role.Authenticated;

final User user = User(
  id: userId,
  email: userEmail,
  username: userUsername,
  avatarUrl: userAvatarUrl,
  role: userRole,
);

final User correctChangeAvatarUser = User(
  id: user.id,
  email: user.email,
  username: user.username,
  avatarUrl: newAvatarUrl,
  role: user.role,
);
//! for uncorect ChangeAvatarUrl
final User incorrectChangeAvatarUser = User(
  id: user.id,
  email: user.email,
  username: user.username,
  avatarUrl: '---',
  role: user.role,
);

//! for 2 'when' correct ChangeUserName
const String newUserName = 'newUserName';
final User correctChangeUserNameUser = User(
  id: user.id,
  email: user.email,
  username: newUserName,
  avatarUrl: '---',
  role: user.role,
);
//! for uncorect ChangeUserName
final User incorrectChangeUserNameUser = User(
  id: user.id,
  email: user.email,
  username: user.username,
  avatarUrl: '---',
  role: user.role,
);

//! for 3 'when' correct Log In
const String email = 'email@email.com';
const String password = 'password';
const String incorrectEmail = '--@--.--';
const String incorrectPassword = '----';
const String incorrectUserName = '----0-0----';
const String incorrectAvatarUrl = '----';

MockUserRepository arangeMockUserRepository() {
  final MockUserRepository mockUserRepository = MockUserRepository();

  //!1 correct ChangeAvatarUrl
  when(mockUserRepository.changeAvatarUrl(user: user, newAvatarUrl: newAvatarUrl)).thenAnswer(
    (_) async {
      return Right(correctChangeAvatarUser);
    },
  );
  //! incorrect ChangeAvatarUrl//
  when(mockUserRepository.changeAvatarUrl(user: user, newAvatarUrl: incorrectAvatarUrl)).thenAnswer(
    (_) async {
      return Left(ExtraFailure(StackTrace.empty));
    },
  );

  // //!2 correct ChangeUserName
  // when(mockUserRepository.changeUserName(user: user, newUserName: newUserName)).thenAnswer(
  //   (_) async {
  //     return Right(correctChangeUserNameUser);
  //   },
  // );
  // //! incorrect ChangeUserName
  // when(mockUserRepository.changeUserName(user: user, newUserName: incorrectUserName)).thenAnswer(
  //   (_) async {
  //     return Left(ExtraFailure(StackTrace.empty));
  //   },
  // );

  // //!3 correct Log In
  // when(mockUserRepository.loginUser(email: email, password: password)).thenAnswer(
  //   (_) async {
  //     return Right(user);
  //   },
  // );
  // //! incorrectEmail Log In
  // when(mockUserRepository.loginUser(email: incorrectEmail, password: password)).thenAnswer(
  //   (_) async {
  //     return Left(ExtraFailure(StackTrace.empty));
  //   },
  // );
  // //! incorrectPassword Log In
  // when(mockUserRepository.loginUser(email: email, password: incorrectPassword)).thenAnswer(
  //   (_) async {
  //     return Left(ExtraFailure(StackTrace.empty));
  //   },
  // );
  // //! incorrectEmail and incorrectPassword Log In
  // when(mockUserRepository.loginUser(email: incorrectEmail, password: incorrectPassword)).thenAnswer(
  //   (_) async {
  //     return Left(ExtraFailure(StackTrace.empty));
  //   },
  // );

  return mockUserRepository;
}
