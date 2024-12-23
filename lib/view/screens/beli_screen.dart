import 'package:flutter/material.dart';
import 'package:herbal/core/API/produkApi.dart';
import 'package:herbal/core/models/produk_model.dart';
import 'package:herbal/view/screens/searchBar.dart';
import 'package:herbal/view/widgets/item_beli.dart';
import 'package:herbal/view/widgets/kategori.dart';
import 'package:herbal/view/widgets/title_text.dart';

class BeliObatScreen extends StatelessWidget {
  const BeliObatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final int jumlahKategori = 3;

    return Scaffold(
      appBar: SearchBarWidget(controller: searchController),
      body: FutureBuilder<List<ProdukModel>>(
        // Mengambil data produk dari API
        future: getProduk(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada produk.'));
          }

          List<ProdukModel> produkList = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TitlesTextWidget(label: "Kategori Populer"),
                  ),
                  const SizedBox(height: 10),
                  Kategori_Widgets(itemCount: jumlahKategori),
                  const SizedBox(height: 20),
                  Center(
                    child: TitlesTextWidget(label: "Produk Paling Dicari"),
                  ),
                  const SizedBox(height: 20),
                  // Kirim produkList ke ItemBeliWidget
                  ItemBeliWidget(produkList: produkList), 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
