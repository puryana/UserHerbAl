import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryRamModel with ChangeNotifier {
  final String historyId;
  final String ramuanId;
  final Timestamp timestamp;

  HistoryRamModel({
    required this.historyId,
    required this.ramuanId,
    required this.timestamp,
  });
}