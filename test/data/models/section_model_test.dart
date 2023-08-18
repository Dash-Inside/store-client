import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/src/data/models/section_model.dart';

void main() {
  group('section_model_test', () {
    test('factory_fromMap_test', () {
      const Map<String, dynamic> sectionModelMap = {
        "id": 2,
        "attributes": {
          "title": "Ia testiruu",
          "createdAt": "2023-08-16T14:23:45.231Z",
          "updatedAt": "2023-08-16T14:23:45.231Z",
          "publishedAt": "2023-08-16T14:23:45.230Z",
          "topicID": 666,
        },
      };

      final SectionModel trueSectionModel = SectionModel(
        id: 2,
        title: "Ia testiruu",
        topicId: 666,
      );

      final SectionModel result = SectionModel.fromMap(sectionModelMap);

      expect(result, trueSectionModel);
    });

    test('factory_fromJson_test', () {
      const String sectionModelJson = '{"id": 2,"attributes": {"title": "Ia testiruu","createdAt": "2023-08-16T14:23:45.231Z","updatedAt": "2023-08-16T14:23:45.231Z","publishedAt": "2023-08-16T14:23:45.230Z","topicID": 666}}';

      final SectionModel trueSectionModel = SectionModel(
        id: 2,
        title: "Ia testiruu",
        topicId: 666,
      );

      final SectionModel result = SectionModel.fromJson(sectionModelJson);

      expect(result, trueSectionModel);
    });

    group('method_copyWith_test', () {
      test('method_copyWith_test_with_params', () {
        final SectionModel trueSectionModel = SectionModel(
          id: 2,
          title: "Ia testiruu",
          topicId: 666,
        );

        final SectionModel mathcer = SectionModel(
          id: 0,
          title: '',
          topicId: 0,
        );

        final SectionModel result = mathcer.copyWith(
          id: 2,
          title: "Ia testiruu",
          topicId: 666,
        );

        expect(result, trueSectionModel);
      });

      test('method_copyWith_test_without_params', () {
        final SectionModel trueSectionModel = SectionModel(
          id: 0,
          title: "",
          topicId: 0,
        );

        final SectionModel mathcer = SectionModel(
          id: 0,
          title: '',
          topicId: 0,
        );

        final SectionModel result = mathcer.copyWith();

        expect(result, trueSectionModel);
      });
    });

    test('method_toMap_test', () {
      const Map<String, dynamic> trueSectionModelMap = {
        "id": 2,
        "title": "Ia testiruu",
        "topicID": 666,
      };

      final SectionModel sectionModel = SectionModel(
        id: 2,
        title: "Ia testiruu",
        topicId: 666,
      );

      final Map<String, dynamic> result = sectionModel.toMap();

      expect(result, trueSectionModelMap);
    });

    test('method_toJson_test', () {
      const String trueSectionModelJson = '{"id":2,"title":"Ia testiruu","topicID":666}';

      final SectionModel sectionModel = SectionModel(
        id: 2,
        title: "Ia testiruu",
        topicId: 666,
      );

      final String result = sectionModel.toJson();

      expect(result, trueSectionModelJson);
    });
  });
}
