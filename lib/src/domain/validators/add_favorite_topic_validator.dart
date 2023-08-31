import 'dart:async';

import 'package:store_client/core/validator/validator.dart';

class AddFavoriteTopicValidator extends Validator<int> {
  @override
  FutureOr<bool> validate(int t) {
    return t > 0;
  }
}
