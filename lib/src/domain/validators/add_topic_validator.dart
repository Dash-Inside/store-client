import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart';

class AddTopicValidator extends Validator<AddTopicUseCaseParams> {
  @override
  FutureOr<bool> validate(AddTopicUseCaseParams t) {
    return t.title.isNotEmpty && t.data.isNotEmpty && (t.links.length > 0) && (t.links.where((element) => element.isEmpty).length == 0);
  }
}
