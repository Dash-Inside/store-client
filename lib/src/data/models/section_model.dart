import 'dart:convert';

import 'package:store_client/src/domain/entities/section.dart';

class SectionModel extends Section {
  SectionModel({
    required super.id,
    required super.title,
    required super.topicId,
  });

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] as int,
      title: map['attributes']['title'] as String,
      topicId: map['attributes']['topicId'] as int,
    );
  }

  factory SectionModel.fromJson(String source) => SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SectionModel copyWith({
    int? id,
    String? title,
    int? topicId,
  }) {
    return SectionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      topicId: topicId ?? this.topicId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'topicId': topicId,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SectionModel(id: $id, title: $title, topicId: $topicId)';
}
