import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final int id;
  final String title;
  final String data;
  final List<String>? links;

  @override
  List<Object?> get props => [id];

  Topic({
    required this.id,
    required this.title,
    required this.data,
    required this.links,
  });
}
