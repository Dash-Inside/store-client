import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int id;
  final String data;
  final int senderId;
  @override
  List<Object?> get props => [id];
  Message({
    required this.id,
    required this.data,
    required this.senderId,
  });
}
