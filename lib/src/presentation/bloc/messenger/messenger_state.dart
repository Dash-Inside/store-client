part of 'messenger_bloc.dart';

sealed class MessengerState extends Equatable {
  @override
  List<Object> get props => [];

  const MessengerState();
}

final class EmptyMessengerState extends MessengerState {}

final class DataMessengerState extends MessengerState {
  final User me;
  final List<Message> messages;

  DataMessengerState({
    required this.me,
    required this.messages,
  });
}
