// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:herbal/core/models/history_model.dart';
// import 'package:herbal/core/models/history_service.dart';
// import 'package:herbal/core/models/ramuan_model.dart';
// import 'package:uuid/uuid.dart';

// class HistoryRamProvider with ChangeNotifier {
//   final Map<String, HistoryRamModel> _viewedRamItems = {};
//   final Map<String, RamuanModel> _ramuanDetails = {};

//   Map<String, HistoryRamModel> get getHistoryRam {
//     return _viewedRamItems;
//   }

//   Map<String, RamuanModel> get getRamuanDetails {
//     return _ramuanDetails;
//   }

//   HistoryRamProvider() {
//     _fetchHistory();
//   }

//   Future<void> addViewedRam({required String ramuanId}) async {
//     final history = HistoryRamModel(
//       historyId: Uuid().v4(),
//       ramuanId: ramuanId,
//       timestamp: Timestamp.now(),
//     );

//     _viewedRamItems[ramuanId] = history;
//     notifyListeners();

//     // Simpan ke Firestore
//     await HistoryService().addHistory(ramuanId);

//     // Ambil detail ramuan dari Firestore
//     await _fetchRamuanDetails(ramuanId);
//   }

//   Future<void> _fetchHistory() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String userId = user.uid;
//       QuerySnapshot historySnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .collection('history')
//           .get();

//       for (var doc in historySnapshot.docs) {
//         HistoryRamModel history = HistoryRamModel(
//           historyId: doc['historyId'],
//           ramuanId: doc['ramuanId'],
//           timestamp: doc['timestamp'],
//         );
//         print("Fetched History: ${history.ramuanId}");
//         _viewedRamItems[doc['ramuanId']] = history;
//         await _fetchRamuanDetails(doc['ramuanId']);
//       }
//       notifyListeners();
//     }
//   }

//   Future<void> _fetchRamuanDetails(String ramuanId) async {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('ramuan')
//         .doc(ramuanId)
//         .get();
//     RamuanModel ramuan = RamuanModel;
//     _ramuanDetails[ramuanId] = ramuan;
//     print("Fetched Ramuan Details: ${ramuan.namaRamuan}");
//     notifyListeners();
//   }

//   Future<void> clearHistory() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String userId = user.uid;

//       // Hapus riwayat dari Firestore
//       WriteBatch batch = FirebaseFirestore.instance.batch();
//       QuerySnapshot historySnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .collection('history')
//           .get();
//       for (var doc in historySnapshot.docs) {
//         batch.delete(doc.reference);
//       }
//       await batch.commit();

//       // Hapus riwayat dari penyimpanan lokal
//       _viewedRamItems.clear();
//       _ramuanDetails.clear();
//       notifyListeners();
//     }
//   }
// }
