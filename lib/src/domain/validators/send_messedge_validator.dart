import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/entities/message.dart';

class SendMessedgeValidator extends Validator<Message> {
  @override
  FutureOr<bool> validate(Message message) {
    if ((message.id < 0) || (message.senderId < 0) || ((message.id < 0) && (message.senderId < 0))) {
      return false;
    }

    return true;
  }
}
