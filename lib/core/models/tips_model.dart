import 'package:herbal/core/API/tipsApi.dart';

class TipsModel {
  final String id_tips;
  final String nama_tips;
  final String gambar;
  final String deskripsi;
  final String resep1;  // Tipe data menjadi String
  final String resep2;  // Tipe data menjadi String
  final String resep3;  // Tipe data menjadi String

  TipsModel({
    required this.id_tips,
    required this.nama_tips,
    required this.gambar,
    required this.deskripsi,
    required this.resep1,
    required this.resep2,
    required this.resep3,
  });

  // Factory constructor untuk parsing JSON menjadi objek TipsModel
  factory TipsModel.fromJson(Map<String, dynamic> json) {
    return TipsModel(
      id_tips: json['id_tips']?.toString() ?? '',  // Default ke string kosong jika null
      nama_tips: json['nama_tips'] ?? 'Tidak diketahui',
      gambar: json['gambar']?.isNotEmpty == true
          ? '$tipsImageBaseUrl/${json['gambar']}'  // Path lengkap untuk gambar
          : '$tipsImageBaseUrl/default.jpg',
      deskripsi: json['deskripsi'] ?? 'Tidak ada deskripsi',
      resep1: json['resep1'] ?? 'Tidak ada resep',
      resep2: json['resep2'] ?? 'Tidak ada resep',
      resep3: json['resep3'] ?? 'Tidak ada resep',
    );
  }

  // Untuk mengubah objek menjadi map (untuk request API)
  Map<String, dynamic> toJson() {
    return {
      'id_tips': id_tips,
      'nama_tips': nama_tips,
      'gambar': gambar.replaceFirst('$tipsImageBaseUrl/', ''), // Hapus base URL untuk upload
      'deskripsi': deskripsi,
      'resep1': resep1,
      'resep2': resep2,
      'resep3': resep3,
    };
  }
}
