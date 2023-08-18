import 'dart:convert';

import 'package:store_client/src/domain/entities/topic.dart';

class TopicModel extends Topic {
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ data.hashCode ^ links.hashCode;

  TopicModel({
    required super.id,
    required super.title,
    required super.data,
    required super.links,
  });

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    final listLinks = (map['attributes']['links'] as String).split(";");

    return TopicModel(
      id: map['id'] as int,
      title: map['attributes']['title'] as String,
      data: map['attributes']['data'] as String,
      links: listLinks,
    );
  }

  factory TopicModel.fromJson(String source) => TopicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TopicModel copyWith({
    int? id,
    String? title,
    String? data,
    List<String>? links,
  }) {
    return TopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
      data: data ?? this.data,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'data': data,
      'links': links,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserDataModel(id: $id, title : $title, data : $data, links: $links)';
  }

  @override
  bool operator ==(covariant TopicModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.data == data && other.links == links;
  }
}
