import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/consts/app_colors.dart';
import 'package:herbal/core/models/penyakit_model.dart';

class Detail_Penyakit extends StatefulWidget {
  final PenyakitModel penyakit;
  const Detail_Penyakit({super.key, required this.penyakit});

  @override
  State<Detail_Penyakit> createState() => _Detail_PenyakitState();
}

class _Detail_PenyakitState extends State<Detail_Penyakit> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor,
      body: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(
                  widget.penyakit.gambar,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(
                        backgroundColor: isDarkMode ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        fixedSize: const Size(50, 50),
                      ),
                      icon: const Icon(CupertinoIcons.chevron_back),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: toggleFavorite,
                      style: IconButton.styleFrom(
                        backgroundColor: isDarkMode ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        isFavorited ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        color: isFavorited ? Colors.red : (isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.width * 3 / 4 - 20,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.darkCardColor : AppColors.lightScaffoldColor ,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                widget.penyakit.nama_penyakit,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, 
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: widget.penyakit.deskripsi,
                      style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "a. Penyebab",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                          height: 1.5,
                        ),
                        text: widget.penyakit.penyebab,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "b. Gejala",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                          height: 1.5,
                        ),
                        text: widget.penyakit.gejala,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "c. Pantangan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                          height: 1.5,
                        ),
                        text: widget.penyakit.pantangan,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "d. Anjuran",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.darkTextColor : Colors.black,
                          height: 1.5,
                        ),
                        text: widget.penyakit.anjuran,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
