// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:store_client/src/domain/entities/role.dart';

class UserData extends Equatable {
  final int id;
  final String email;
  final String username;
  final String avatarUrl;
  final Role role;

  @override
  List<Object?> get props => [id, username];

  UserData({
    required this.id,
    required this.email,
    required this.username,
    required this.avatarUrl,
    required this.role,
  });
}
