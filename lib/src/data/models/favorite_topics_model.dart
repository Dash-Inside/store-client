// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:store_client/src/domain/entities/favorite_topics.dart';

class FavoriteTopicsModel extends FavoriteTopics {
  final int favoritTopicId;
  final int userID;
  final int topicID;

  factory FavoriteTopicsModel.fromJson(String source) => FavoriteTopicsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FavoriteTopicsModel.fromMap(Map<String, dynamic> map) {
    return FavoriteTopicsModel(
      favoritTopicId: map['id'] as int,
      userID: map['attributes']['userID'] as int,
      topicID: map['attributes']['topicID'] as int,
    );
  }

  FavoriteTopicsModel({
    required this.favoritTopicId,
    required this.userID,
    required this.topicID,
  }) : super(
          favoritTopicId: favoritTopicId,
          userID: userID,
          topicID: topicID,
        );

  FavoriteTopicsModel copyWith({
    int? favoritTopicId,
    int? userID,
    int? topicID,
  }) {
    return FavoriteTopicsModel(
      favoritTopicId: favoritTopicId ?? this.favoritTopicId,
      userID: userID ?? this.userID,
      topicID: topicID ?? this.topicID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': favoritTopicId,
      'data': {
        'userID': userID,
        'topicID': topicID,
      },
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'FavoriteTopicsModel(favoritTopicId: $favoritTopicId, userID: $userID, topicID: $topicID)';
}
