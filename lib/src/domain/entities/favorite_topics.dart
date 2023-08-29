import 'package:equatable/equatable.dart';

class FavoriteTopics extends Equatable {
  final int userID;
  final int topicID;

  @override
  List<Object?> get props => [userID];

  FavoriteTopics({
    required this.userID,
    required this.topicID,
  });
}
