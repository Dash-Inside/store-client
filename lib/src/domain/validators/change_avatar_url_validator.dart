import 'dart:async';

import 'package:store_client/core/validator/validator.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';

class ChangeAvatarUrlValidator extends Validator<ChangeAvatarUrlUseCaseParams> {
  @override
  FutureOr<bool> validate(ChangeAvatarUrlUseCaseParams params) {
    if (params.user.avatarUrl == params.newAvatarUrl) return false;
    if (params.newAvatarUrl.isEmpty) return false;

    return RegExp(
      r'(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])',
    ).hasMatch(params.user.avatarUrl);
  }
}
