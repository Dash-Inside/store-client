import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/domain/entities/actions/add_topic_action_params.dart';
import 'package:store_client/src/domain/validators/add_topic_validator.dart';

void main() {
  final AddTopicActionParams correctAddTopicActionParams = AddTopicActionParams(
    title: 'test',
    data: 'test data',
    links: ['http://test.xyz'],
  );

  final AddTopicActionParams incorrectAddTopicActionParams1 = AddTopicActionParams(
    title: '',
    data: 'test data',
    links: ['http://test.xyz'],
  );

  final AddTopicActionParams incorrectAddTopicActionParams2 = AddTopicActionParams(
    title: 'test',
    data: '',
    links: ['http://test.xyz'],
  );

  final AddTopicActionParams incorrectAddTopicActionParams3 = AddTopicActionParams(
    title: 'test',
    data: 'test data',
    links: [''],
  );

  group('Add Topic Validator', () {
    final AddTopicValidator addTopicValidator = AddTopicValidator();
    test('Correct Input Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(correctAddTopicActionParams);
      // Assert
      expect(result, true);
    });

    test('Incorrect Input Title Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicActionParams1);
      // Assert
      expect(result, false);
    });

    test('Incorrect Input Data Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicActionParams2);
      // Assert
      expect(result, false);
    });

    test('Incorrect Input Links Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicActionParams3);
      // Assert
      expect(result, false);
    });
  });
}
