import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'history_model.dart';

class HistoryService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addHistory(String ramuanId) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String userId = user.uid;

        // Membuat historyId baru
        DocumentReference historyRef = _firestore
            .collection('users')
            .doc(userId)
            .collection('history')
            .doc();

        // Membuat model History
        HistoryRamModel history = HistoryRamModel(
          historyId: historyRef.id,
          ramuanId: ramuanId,
          timestamp: Timestamp.now(),
        );

        // Menyimpan ke Firestore
        await historyRef.set({
          'historyId': history.historyId,
          'ramuanId': history.ramuanId,
          'timestamp': history.timestamp,
        });

        print("History berhasil ditambahkan!");
      } else {
        print("User belum login.");
      }
    } catch (e) {
      print("Gagal menambahkan history: $e");
    }
  }
}
