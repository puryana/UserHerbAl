import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel => userModel;

  bool get isLoggedIn => userModel != null;

  Future<void> fetchUserInfo() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return;
    }
    String uid = user.uid;
    try {
      final userDoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();

      final userDocDict = userDoc.data();
      if (userDocDict != null) {
        userModel = UserModel(
          userId: userDoc.get("userId"),
          userName: userDoc.get("userName"),
          userImage: userDoc.get("userImage"),
          userEmail: userDoc.get('userEmail'),
          userFav: userDocDict.containsKey("userFav") ? userDoc.get("userFav") : [],
          userHist: userDocDict.containsKey("userHist") ? userDoc.get("userHist") : [],
          createdAt: userDoc.get('createdAt'),
        );
        notifyListeners();
      }
    } on FirebaseException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
