// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int super.id,
    required String super.email,
    required String super.username,
    required String super.avatarUrl,
    required Role super.role,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? username,
    String? avatarUrl,
    Role? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, username: $username, avatarUrl: $avatarUrl, role: $role)';
  }
}
