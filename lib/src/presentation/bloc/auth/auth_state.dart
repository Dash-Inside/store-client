part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];

  const AuthState();
}

final class NullAuthState extends AuthState {}

final class DataAuthState extends AuthState {}
