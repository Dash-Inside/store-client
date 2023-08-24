part of 'messenger_bloc.dart';

sealed class MessengerEvent extends Equatable {
  @override
  List<Object> get props => [];

  const MessengerEvent();
}

final class SendMessengerEvent extends MessengerEvent {
  final String message;

  SendMessengerEvent({
    required this.message,
  });
}
