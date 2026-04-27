import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String photoURL;
  final bool isOnline;
  final DateTime lastSeen;
  final DateTime createAt;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoURL = "",
    this.isOnline = false,
    required this.lastSeen,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "displayName": displayName,
      "photoURL": photoURL,
      "isOnline": isOnline,
      "lastSeen": lastSeen,
      "createAt": createAt,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      photoURL: map['photoURL'] ?? '',
      isOnline: map['isOnline'] ?? false,
      lastSeen: map['lastSeen']!=null?(map['lastSeen']as Timestamp).toDate():DateTime.now(),
      createAt: map['createAt']!=null ?(map['createAt'] as Timestamp).toDate() :DateTime.now()
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoURL,
    bool? isOnline,
    DateTime? lastSeen,
    DateTime? createAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isOnline: isOnline??this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      createAt: createAt ?? this.createAt,
    );
  }
}
