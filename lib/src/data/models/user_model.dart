// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user.dart';

class UserModel extends User {
  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      username: map['username'] as String,
      avatarUrl: map['avatarUrl'] as String,
      role: map['role'] == 'Authenticated' ? Role.Authenticated : Role.Public,
    );
  }

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'avatarUrl': avatarUrl,
      'role': role == Role.Authenticated ? 'Authenticated' : 'Public',
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, username: $username, avatarUrl: $avatarUrl, role: $role)';
  }
}
