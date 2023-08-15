part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];

  const AuthState();
}

final class InitAuthState extends AuthState {}
