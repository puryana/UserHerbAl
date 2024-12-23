// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:herbal/core/models/ramuan_model.dart';

// class RamuanProvider with ChangeNotifier {
//   List<RamuanModel> _ramuan = [];

//   List<RamuanModel> get getRamuan {
//     return [..._ramuan];
//   }

//   RamuanModel? findByProdId(String ramuanId) {
//     try {
//       return _ramuan.firstWhere((element) => element.ramuanId == ramuanId);
//     } catch (e) {
//       return null;
//     }
//   }

//   List<RamuanModel> findByCategory({required String namaKategori}) {
//     return _ramuan
//         .where((element) => element.kategori.toLowerCase().contains(namaKategori.toLowerCase()))
//         .toList();
//   }

//   List<RamuanModel> searchQuery({required String searchText, required List<RamuanModel> passedList}) {
//     return passedList
//         .where((element) => element.namaRamuan.toLowerCase().contains(searchText.toLowerCase()))
//         .toList();
//   }

//   final CollectionReference ramuanDb = FirebaseFirestore.instance.collection("ramuan");

//   Future<void> fetchProducts() async {
//     try {
//       final productSnapshot = await ramuanDb.orderBy('createdAt', descending: false).get();
//       _ramuan.clear();
//       for (var element in productSnapshot.docs) {
//         _ramuan.add(RamuanModel.fromFirestore(element));
//       }
//       notifyListeners();
//     } catch (e) {
//       throw e;
//     }
//   }

//   Stream<List<RamuanModel>> fetchProductsStream() {
//     return ramuanDb.snapshots().map((snapshot) {
//       _ramuan.clear();
//       for (var element in snapshot.docs) {
//         _ramuan.add(RamuanModel.fromFirestore(element));
//       }
//       return _ramuan;
//     }).handleError((error) {
//       print("Error in fetchProductsStream: $error");
//     });
//   }
// }
