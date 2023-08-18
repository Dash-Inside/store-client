import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String userName;
  final String email;

  @override
  List<Object> get props => [id, userName, email];

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      userName: map['username'] as String,
      email: map['email'] as String,
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    int? id,
    String? userName,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'email': email,
    };
  }

  String toJson() => json.encode(toMap());
}
