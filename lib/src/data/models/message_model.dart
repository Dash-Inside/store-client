// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:store_client/src/domain/entities/message.dart';

class MessageModel extends Message {
  final int id;
  final String data;
  final int senderId;

  @override
  int get hashCode => id.hashCode ^ data.hashCode ^ senderId.hashCode;

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      data: map['attributes']['data'] as String,
      senderId: map['attributes']['senderID'] as int,
    );
  }

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MessageModel({
    required this.id,
    required this.data,
    required this.senderId,
  }) : super(
          id: id,
          data: data,
          senderId: senderId,
        );

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
      'data': {
        'data': data,
        'senderID': senderId,
      },
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'MessageModel(id: $id, data: $data, senderId: $senderId)';

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.data == data && other.senderId == senderId;
  }
}
