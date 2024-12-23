import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/consts/app_colors.dart';
import 'package:herbal/core/models/produk_model.dart';

class DetailProduk extends StatefulWidget {
  final ProdukModel produk; 

  const DetailProduk({super.key, required this.produk});

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final produk = widget.produk; 

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(
          backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
          elevation: 0,
          toolbarHeight: 20,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Baris Tombol Navigasi Kembali dan Favorit
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.chevron_back),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: toggleFavorite,
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorited ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Gambar Produk
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Image.network(
                  produk.gambar,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Box Hijau dengan Harga dan Nama Produk
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Text(
                    produk.nama_produk,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "Rp. ${produk.harga}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),

            Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.darkCardColor : AppColors.lightCardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                if (!isDarkMode)
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  produk.deskripsi ?? "Tidak ada deskripsi.",
                  textAlign: TextAlign.justify, // Rata kiri-kanan
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Manfaat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  produk.manfaat ?? "Tidak ada manfaat.",
                  textAlign: TextAlign.justify, // Rata kiri-kanan
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Efek Samping',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  produk.efekSamping ?? "Tidak ada efek samping.",
                  textAlign: TextAlign.justify, // Rata kiri-kanan
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Waktu Konsumsi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  produk.waktuKonsumsi ?? "Tidak ada waktu konsumsi.",
                  textAlign: TextAlign.justify, // Rata kiri-kanan
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                  ),
                ),
              ],
            ),
          )

          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 60,
        color: isDarkMode ? AppColors.darkCardColor : Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.chat, color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary, size: 28),
                onPressed: () {},
              ),
            ),
            Container(
              height: 30,
              width: 1,
              color: isDarkMode ? Colors.white30 : Colors.grey,
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary, size: 28),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                ),
                child: const Text(
                  'Beli Sekarang',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
