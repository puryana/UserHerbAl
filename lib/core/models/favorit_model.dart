import 'package:flutter/material.dart';

class FavoritModel with ChangeNotifier {
  final String favoritId;
  final String ramuanId;

  FavoritModel({
    required this.favoritId,
    required this.ramuanId,
  });
}
