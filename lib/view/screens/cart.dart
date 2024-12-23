import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/consts/app_colors.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkScaffoldColor : Colors.grey[200],
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
        title: const Text(
          "Keranjang",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.chevron_left, color: Colors.white),
        ),
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/cart.png',
                  height: 300,
                  color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                ),
                Positioned(
                  bottom: 40,
                  child: Text(
                    "Keranjang belanjamu masih kosong",
                    style: TextStyle(
                      color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk memulai belanja
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
              child: const Text(
                "Mulai Belanja",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCardColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: isDarkMode ? AppColors.darkCardColor : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rp 0",
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Menggunakan InkWell untuk memberikan efek ripple pada "Checkout"
            Expanded(
              child: InkWell(
                onTap: () {
                  // Aksi untuk checkout
                },
                highlightColor: Colors.white.withOpacity(0.2), // Warna saat ditekan
                splashColor: Colors.transparent, // Menghilangkan efek splash
                child: Container(
                  height: double.infinity,
                  color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                  child: Center(
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
