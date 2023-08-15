import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  MessengerBloc() : super(InitMessengerState()) {}
}
