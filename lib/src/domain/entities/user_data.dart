import 'package:equatable/equatable.dart';

import 'package:store_client/src/domain/entities/role.dart';

class UserData extends Equatable {
  final int id;
  final String username;
  final String avatarUrl;
  final Role role;

  @override
  List<Object?> get props => [id, username];

  UserData({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.role,
  });
}
