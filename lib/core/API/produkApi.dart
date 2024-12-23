import 'dart:convert';
import 'package:herbal/core/models/produk_model.dart';
import 'package:http/http.dart' as http;

// Base URL untuk API
const String baseUrl = 'http://192.168.1.16:8000';

// Endpoint untuk 
const String produkEndpoint = '$baseUrl/api/produk';

// Base URL untuk gambar
const String produkImageBaseUrl = '$baseUrl/storage/img/produk';

// Fungsi untuk mengambil data  dari API
Future<List<ProdukModel>> getProduk() async {
  try {
    // Mengirim request GET ke API
    final response = await http.get(Uri.parse(produkEndpoint));

    // Memastikan response status code 200 (OK)
    if (response.statusCode == 200) {
      // Parsing response body yang berupa JSON
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Mengakses properti 'data' yang berisi daftar 
      if (jsonResponse.containsKey('data')) {
        final List<dynamic> data = jsonResponse['data'];

        // Mengembalikan list  yang sudah diparse ke objek 
        return data.map((item) => ProdukModel.fromJson(item)).toList();
      } else {
        // Struktur JSON tidak sesuai
        throw Exception('Unexpected response structure: Missing "data" key');
      }
    } else {
      // Gagal mendapatkan response yang valid
      throw Exception('Failed to load categories. HTTP Status: ${response.statusCode}');
    }
  } catch (e) {
    // Log error untuk debugging
    print('Error fetching categories: $e');
    return []; // Kembalikan list kosong jika terjadi error
  }
}
