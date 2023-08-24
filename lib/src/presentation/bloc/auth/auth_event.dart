part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];

  const AuthEvent();
}

class LoginAuthEvent extends AuthEvent {
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  LoginAuthEvent({
    required this.email,
    required this.password,
  });
}

class RecheckTokenAuthEvent extends AuthEvent {}
