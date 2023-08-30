import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart';
import 'package:store_client/src/domain/validators/add_topic_validator.dart';

void main() {
  final AddTopicUseCaseParams correctAddTopicUseCaseParams = AddTopicUseCaseParams(
    title: 'test',
    data: 'test data',
    links: ['http://test.xyz'],
  );

  final AddTopicUseCaseParams incorrectAddTopicUseCaseParams1 = AddTopicUseCaseParams(
    title: '',
    data: 'test data',
    links: ['http://test.xyz'],
  );

  final AddTopicUseCaseParams incorrectAddTopicUseCaseParams2 = AddTopicUseCaseParams(
    title: 'test',
    data: '',
    links: ['http://test.xyz'],
  );

  final AddTopicUseCaseParams incorrectAddTopicUseCaseParams3 = AddTopicUseCaseParams(
    title: 'test',
    data: 'test data',
    links: [''],
  );

  group('Add Topic Validator', () {
    final AddTopicValidator addTopicValidator = AddTopicValidator();
    test('Correct Input Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(correctAddTopicUseCaseParams);
      // Assert
      expect(result, true);
    });

    test('Incorrect Input Title Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicUseCaseParams1);
      // Assert
      expect(result, false);
    });

    test('Incorrect Input Data Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicUseCaseParams2);
      // Assert
      expect(result, false);
    });

    test('Incorrect Input Links Validator', () async {
      // Arrange
      final result = await addTopicValidator.validate(incorrectAddTopicUseCaseParams3);
      // Assert
      expect(result, false);
    });
  });
}
