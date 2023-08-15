part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  @override
  List<Object> get props => [];

  const AccountState();
}

final class InitAccountState extends AccountState {}
