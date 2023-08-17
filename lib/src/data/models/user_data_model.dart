import 'dart:convert';

import 'package:store_client/src/domain/entities/role.dart';
import 'package:store_client/src/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  @override
  int get hashCode {
    return id.hashCode ^ username.hashCode ^ avatarUrl.hashCode ^ role.hashCode;
  }

  UserDataModel({
    required super.id,
    required super.username,
    required super.avatarUrl,
    required super.role,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as int,
      username: map['attributes']['username'] as String,
      avatarUrl: map['attributes']['avatarUrl'] as String,
      role: Role.values.where(((element) => element.name == map['attributes']['role'])).first,
    );
  }

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserDataModel copyWith({
    int? id,
    String? username,
    String? avatarUrl,
    Role? role,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'avatarUrl': avatarUrl,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserDataModel(id: $id, username: $username, avatarUrl: $avatarUrl, role: $role)';
  }

  @override
  bool operator ==(covariant UserDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.username == username && other.avatarUrl == avatarUrl && other.role == role;
  }
}
