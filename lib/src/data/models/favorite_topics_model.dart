// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:store_client/src/domain/entities/favorite_topics.dart';

class FavoriteTopicsModel extends FavoriteTopics {
  @override
  int get hashCode => userID.hashCode ^ topicID.hashCode;

  factory FavoriteTopicsModel.fromJson(String source) => FavoriteTopicsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FavoriteTopicsModel.fromMap(Map<String, dynamic> map) {
    return FavoriteTopicsModel(
      userID: map['attributes']['userID'] as int,
      topicID: map['attributes']['topicID'] as int,
    );
  }

  FavoriteTopicsModel({
    required super.userID,
    required super.topicID,
  });

  FavoriteTopicsModel copyWith({
    int? userID,
    int? topicID,
  }) {
    return FavoriteTopicsModel(
      userID: userID ?? this.userID,
      topicID: topicID ?? this.topicID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'userID': userID,
        'topicID': topicID,
      },
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'FavoriteTopicsModel(userID: $userID, topicID: $topicID)';

  @override
  bool operator ==(covariant FavoriteTopicsModel other) {
    if (identical(this, other)) return true;

    return other.userID == userID && other.topicID == topicID;
  }
}
