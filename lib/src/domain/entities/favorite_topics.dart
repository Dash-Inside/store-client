import 'package:equatable/equatable.dart';

class FavoriteTopics extends Equatable {
  final int favoritTopicId;
  final int userID;
  final int topicID;

  @override
  List<Object?> get props => [favoritTopicId];

  FavoriteTopics({
    required this.favoritTopicId,
    required this.userID,
    required this.topicID,
  });
}
