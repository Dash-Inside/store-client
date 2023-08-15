part of 'messenger_bloc.dart';

sealed class MessengerState extends Equatable {
  @override
  List<Object> get props => [];

  const MessengerState();
}

final class InitMessengerState extends MessengerState {}
