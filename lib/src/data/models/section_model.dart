import 'dart:convert';

import 'package:store_client/src/domain/entities/section.dart';

class SectionModel extends Section {
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ topicId.hashCode;

  SectionModel({
    required super.id,
    required super.title,
    required super.topicId,
  });

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] as int,
      title: map['attributes']['title'] as String,
      topicId: map['attributes']['topicID'] as int,
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
      'topicID': topicId,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SectionModel(id: $id, title: $title, topicId: $topicId)';

  @override
  bool operator ==(covariant SectionModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.topicId == topicId;
  }
}
