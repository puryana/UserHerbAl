import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/models/favorit_model.dart';
import 'package:herbal/core/providers/my_app_functions.dart';
import 'package:uuid/uuid.dart';

class FavoritProvider with ChangeNotifier {
  final Map<String, FavoritModel> _favoritItems = {};
  Map<String, FavoritModel> get getFavorites {
    return _favoritItems;
  }
  
  final userstDb = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;

  Future<void> addToFavoriteFirebase({
    required String ramuanId,
    required BuildContext context,
  }) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Silakan login terlebih dahulu",
        fct: () {},
      );
      return;
    }
    final uid = user.uid;
    final favoritId = const Uuid().v4();
    try {
      await userstDb.doc(uid).update({
        'userFav': FieldValue.arrayUnion([
          {
            'favoritId': favoritId,
            'ramuanId': ramuanId,
          }
        ])
      });

      _favoritItems[ramuanId] = FavoritModel(favoritId: favoritId, ramuanId: ramuanId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchFavorites() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      _favoritItems.clear();
      return;
    }
    try {
      final userDoc = await userstDb.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey('userFav')) {
        return;
      }
      final length = userDoc.get("userFav").length;
      for (int index = 0; index < length; index++) {
        _favoritItems.putIfAbsent(
            userDoc.get("userFav")[index]['ramuanId'],
            () => FavoritModel(
                  favoritId: userDoc.get("userFav")[index]['favoritId'],
                  ramuanId: userDoc.get("userFav")[index]['ramuanId'],
                ));
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeFavoriteItemFromFirestore({
    required String favoritId,
    required String ramuanId,
  }) async {
    final User? user = _auth.currentUser;
    try {
      await userstDb.doc(user!.uid).update({
        'userFav': FieldValue.arrayRemove([
          {
            'favoritId': favoritId,
            'ramuanId': ramuanId,
          }
        ])
      });
      _favoritItems.remove(ramuanId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearFavoritesFromFirebase() async {
    final User? user = _auth.currentUser;
    try {
      await userstDb.doc(user!.uid).update({
        'userFav': [],
      });
      _favoritItems.clear();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void addOrRemoveFromFavorites({required String ramuanId}) {
    if (_favoritItems.containsKey(ramuanId)) {
      _favoritItems.remove(ramuanId);
    } else {
      _favoritItems.putIfAbsent(
        ramuanId,
        () => FavoritModel(favoritId: const Uuid().v4(), ramuanId: ramuanId),
      );
    }

    notifyListeners();
  }

  bool isProdinFavorites({required String ramuanId}) {
    return _favoritItems.containsKey(ramuanId);
  }

  void clearLocalFavorites() {
    _favoritItems.clear();
    notifyListeners();
  }
}
