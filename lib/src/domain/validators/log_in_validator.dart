import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/usecases/user_data/log_in_usecase.dart';

class LogInValidator extends Validator<LogInUseCaseParams> {
  @override
  FutureOr<bool> validate(LogInUseCaseParams params) {
    if (params.email != RegExp(r'[[a-z][A-Z][.]@email.com]')) return false;
    if (params.password != RegExp(r'[[a-z][A-Z][0-9]]')) return false;

    return true;
  }
}
