import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/entities/user.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  MessengerBloc() : super(EmptyMessengerState()) {}
}
