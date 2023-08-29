import 'dart:async';

import 'package:store_client/core/validator/validator.dart';

class SearchTopicValidator extends Validator<String> {
  @override
  FutureOr<bool> validate(String t) {
    return t.isNotEmpty;
  }
}
