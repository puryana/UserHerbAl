
import 'package:herbal/core/API/produkApi.dart';

class ProdukModel {
  final String id_produk;
  final String id_kategori;
  final String nama_produk;
  final String harga;
  final String gambar;
  final String deskripsi;
  final String manfaat;
  final String efekSamping;
  final String waktuKonsumsi;

  ProdukModel({
    required this.id_produk,
    required this.id_kategori,
    required this.nama_produk,
    required this.harga,
    required this.gambar,
    required this.deskripsi,
    required this.manfaat,
    required this.efekSamping,
    required this.waktuKonsumsi,
  });

  // Membuat factory constructor untuk memparsing JSON ke dalam objek KategoriModel
  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id_produk: json['id_produk']?.toString() ?? '',
      id_kategori: json['id_kategori']?.toString() ?? '', // Default ke string kosong jika null
      nama_produk: json['nama_produk'] ?? 'Tidak diketahui',
      harga: json['harga'] ?? 'Tidak ada harga', // Default value
      gambar: json['gambar']?.isNotEmpty == true
          ? '$produkImageBaseUrl/${json['gambar']}' // Gambar dengan path lengkap
          : '$produkImageBaseUrl/default.jpg', 
      deskripsi: json['deskripsi'] ?? 'Tidak ada deskripsi',
      manfaat: json['manfaat'] ?? 'Tidak ada manfaat',
      efekSamping: json['efekSamping'] ?? 'Tidak ada efek samping',
      waktuKonsumsi: json['waktuKonsumsi'] ?? 'Tidak ada waktu konsumsi',
    );
  }

  // Untuk mengubah objek menjadi map (jika perlu dikirimkan dalam request)
  Map<String, dynamic> toJson() {
    return {
      'id_produk': id_produk, 
      'id_kategori': id_kategori,
      'nama_produk': nama_produk,
      'harga': harga,
      'gambar': gambar.replaceFirst('$produkImageBaseUrl/', ''), 
      'deskripsi': deskripsi,
      'manfaat': manfaat,
      'efekSamping': efekSamping,
      'waktuKonsumsi': waktuKonsumsi,
    };
  }
}
