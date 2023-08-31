import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/domain/validators/id_validator.dart';

import '../services/arrange/mock_library_repository.dart';

void main() {
  group('Add Favorite Topic Validator', () {
    final IdValidator addFavoriteTopicValidator = IdValidator();
    test('Correct Input Validator', () async {
      // Arrange
      final bool result = await addFavoriteTopicValidator.validate(correctId);
      // Assert
      expect(result, true);
    });

    test('Incorrect Input Validator', () async {
      // Arrange
      final bool result = await addFavoriteTopicValidator.validate(incorrectId);
      // Assert
      expect(result, false);
    });
  });
}
