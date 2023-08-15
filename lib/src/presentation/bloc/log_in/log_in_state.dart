part of 'log_in_bloc.dart';

sealed class LogInState extends Equatable {
  @override
  List<Object> get props => [];

  const LogInState();
}

final class InitLogInState extends LogInState {}
