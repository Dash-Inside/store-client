import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

@Singleton()
class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  MessengerBloc()
      : super(EmptyMessengerState()
            // DataMessengerState(
            //   me: User(
            //     id: 3,
            //     email: 'qwerty',
            //     username: 'username',
            //     avatarUrl: 'avatarUrl',
            //     role: Role.Authenticated,
            //   ),
            //   messages: [
            //     Message(id: 4, data: 'new', senderId: 4),
            //     Message(id: 5, data: 'data', senderId: 4),
            //     Message(id: 6, data: 'data', senderId: 4),
            //     Message(id: 4, data: 'data', senderId: 3),
            //   ],
            // ),
            ) {}
}
