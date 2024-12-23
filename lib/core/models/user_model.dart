import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId, userName, userImage, userEmail;
  final Timestamp createdAt;
  final List userFav, userHist;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userFav,
    required this.userHist,
    required this.createdAt,
  });
  
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userId: data['userId'],
      userName: data['userName'],
      userImage: data['userImage'],
      userEmail: data['userEmail'],
      userFav: data['userFav'] ?? [],
      userHist: data['userHist'] ?? [], 
      createdAt: data['createdAt'],
    );
  }
}
