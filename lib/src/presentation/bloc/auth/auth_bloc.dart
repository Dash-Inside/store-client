import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/logger/logger.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/domain/usecases/user_data/log_in_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/recheck_token_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RecheckTokenUseCase recheckTokenUseCase;
  final LogInUseCase logInUseCase;

  AuthBloc({
    required this.recheckTokenUseCase,
    required this.logInUseCase,
  }) : super(NullAuthState()) {
    on<RecheckTokenAuthEvent>(_onRecheckTokenAuthEvent);
    on<LoginAuthEvent>(_onLoginAuthEvent);
  }

  Future<FutureOr<void>> _onRecheckTokenAuthEvent(
    RecheckTokenAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, bool> failOrCheckResult = await recheckTokenUseCase.call(unit);

    failOrCheckResult.fold(
      (fail) => logger.warning('AuthBloc: $fail'),
      (authResult) {
        if (authResult) {
          emit(DataAuthState());
        } else {
          emit(NullAuthState());
        }
      },
    );
  }

  FutureOr<void> _onLoginAuthEvent(
    LoginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Either<Failure, User> failOrUser = await logInUseCase.call(
      LogInUseCaseParams(
        email: event.email,
        password: event.password,
      ),
    );

    logger.warning(failOrUser);

    failOrUser.fold(
      (fail) => logger.warning('AuthBloc: $fail'),
      (user) => emit(DataAuthState()),
    );
  }
}
