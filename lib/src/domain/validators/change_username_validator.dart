import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart';

class ChangeUserNameValidator extends Validator<ChangeUserNameUseCaseParams> {
  @override
  FutureOr<bool> validate(ChangeUserNameUseCaseParams params) {
    if (params.user.username == params.newUserName) return false;

    return true;
  }
}
