// ignore_for_file: prefer-conditional-expressions
import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/entities/actions/add_topic_action_params.dart';

class AddTopicValidator extends Validator<AddTopicActionParams> {
  @override
  FutureOr<bool> validate(AddTopicActionParams t) {
    if (t.title.isNotEmpty && t.data.isNotEmpty && (t.links.length > 0) && (t.links.where((element) => element.isEmpty).length == 0)) {
      return true;
    } else {
      return false;
    }
  }
}
