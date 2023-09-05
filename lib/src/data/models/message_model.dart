// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:store_client/src/domain/entities/message.dart';

class MessageModel extends Message {
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      data: map['attributes']['data'] as String,
      senderId: map['attributes']['senderID'] as int,
    );
  }

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MessageModel({
    required super.id,
    required super.data,
    required super.senderId,
  });

  MessageModel copyWith({
    int? id,
    String? data,
    int? senderId,
  }) {
    return MessageModel(
      id: id ?? this.id,
      data: data ?? this.data,
      senderId: senderId ?? this.senderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': {
        'data': data,
        'senderId': senderId,
      },
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'MessageModel(id: $id, data: $data, senderId: $senderId)';
}
