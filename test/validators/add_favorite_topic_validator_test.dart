import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/domain/validators/add_favorite_topic_validator.dart';

import '../services/arrange/mock_library_repository.dart';

void main() {
  group('Add Favorite Topic Validator', () {
    final AddFavoriteTopicValidator addFavoriteTopicValidator = AddFavoriteTopicValidator();
    test('Correct Input Validator', () async {
      // Arrange
      final result = await addFavoriteTopicValidator.validate(correctId);
      // Assert
      expect(result, true);
    });

    test('Incorrect Input Validator', () async {
      // Arrange
      final result = await addFavoriteTopicValidator.validate(incorrectId);
      // Assert
      expect(result, false);
    });
  });
}
