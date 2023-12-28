import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userID, email, name;

  UserModel({
    required this.userID,
    required this.email,
    required this.name,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          userID: json['userID']! as String,
          email: json['email']! as String,
          name: json['name']! as String,
        );

  UserModel copyWith({
    String? userID,
    String? email,
    String? name,
  }) {
    return UserModel(
      userID: userID ?? this.userID,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
    };
  }
}
