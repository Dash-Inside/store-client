// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [stackTrace];

  Failure({
    required this.message,
    required this.stackTrace,
  });
}
