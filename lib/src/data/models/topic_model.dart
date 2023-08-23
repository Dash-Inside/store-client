import 'dart:convert';

import 'package:store_client/src/domain/entities/topic.dart';

class TopicModel extends Topic {
  TopicModel({
    required super.id,
    required super.title,
    required super.data,
    required super.links,
  });

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    final List<String> listLinks = (map['attributes']['links'] as String).split(";");

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
    String str = '';
    if (links?.length == 1) {
      str = links![0];
    }
    if (links!.length > 1) {
      str = links!.join(';');
    }
    return <String, dynamic>{
      "data": {
        'id': id,
        'title': title,
        'data': data,
        'links': str,
      }
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'TopicModel(id: $id, title : $title, data : $data, links: $links)';
  }
}
