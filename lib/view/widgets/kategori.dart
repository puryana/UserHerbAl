import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:herbal/core/API/kategoriApi.dart';
import 'package:herbal/core/consts/app_colors.dart';
import 'package:herbal/core/models/kategori_model.dart';
import 'package:herbal/view/widgets/layout/ramuan.dart';

class Kategori_Widgets extends StatelessWidget {
  final int itemCount;

  const Kategori_Widgets({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    // Cek apakah mode gelap atau terang sedang aktif
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final scaffoldColor =
        isDarkMode ? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor;
    final cardColor =
        isDarkMode ? AppColors.darkCardColor : AppColors.lightScaffoldColor;
    final textColor =
        isDarkMode ? AppColors.darkTextColor : AppColors.darkCardColor;

    // Mengambil data kategori dari API
    return FutureBuilder<List<KategoriModel>>(
      future: getKategori(), // Memanggil fungsi getKategori() untuk mengambil data dari API
      builder: (context, snapshot) {
        // Menunggu data dari API
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // Jika terjadi error dalam pengambilan data
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // Jika tidak ada data atau data kosong
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Tidak ada kategori'));
        }
        // Jika data berhasil diambil dan ada data kategori
        else {
          // Ambil kategori sesuai jumlah item yang ditentukan oleh itemCount
          List<KategoriModel> kategoriList =
              snapshot.data!.take(itemCount).toList();

          return Container(
            color: scaffoldColor, // Background sesuai mode terang atau gelap
            height: 120, // Ukuran tinggi lebih kecil
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Membuat scroll horizontal
              padding: const EdgeInsets.all(12), // Mengurangi padding
              itemCount: kategoriList.length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(kategoriList[index], cardColor, textColor);
              },
            ),
          );
        }
      },
    );
  }

  // Widget untuk membangun item kategori (kotak) dengan nama di dalam kotak
Widget _buildCategoryItem(KategoriModel kategori, Color cardColor, Color textColor) {
  return Builder(
    builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RamuanTra(
                id_kategori: kategori.id_kategori,
                nama_kategori: kategori.nama_kategori,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CachedNetworkImage(
                      imageUrl: kategori.gambar,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, size: 60),
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      kategori.nama_kategori,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

}