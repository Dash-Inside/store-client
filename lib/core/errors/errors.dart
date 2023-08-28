// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {
  final StackTrace stackTrace;

  @override
  List<Object> get props => [stackTrace];

  Errors({
    required this.stackTrace,
  });
}
