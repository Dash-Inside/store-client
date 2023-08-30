import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/domain/validators/search_topic_validator.dart';

void main() {
  const String correctTitle = 'test';

  const String incorrectTitle = '';

  group('Search Topic Validator', () {
    final SearchTopicValidator searchTopicValidator = SearchTopicValidator();
    test('Correct input test', () async {
      // Arrange.
      final bool result = await searchTopicValidator.validate(correctTitle);
      // Assert.
      expect(result, true);
    });

    test('Incorrect input test', () async {
      // Arrange.
      final bool result = await searchTopicValidator.validate(incorrectTitle);
      // Assert.
      expect(result, false);
    });
  });
}
