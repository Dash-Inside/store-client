import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final int id;
  final String title;
  final int topicId;

  @override
  List<Object?> get props => [id, title];

  Section({
    required this.id,
    required this.title,
    required this.topicId,
  });
}
