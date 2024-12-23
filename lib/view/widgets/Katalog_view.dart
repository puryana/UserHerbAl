// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:herbal/core/models/tanaman_model.dart';
// import 'package:herbal/core/API/tanamanApi.dart';
// import 'package:herbal/view/widgets/tampil_tanaman.dart';

// class Katalog_view extends StatefulWidget {
//   const Katalog_view({super.key});

//   @override
//   State<Katalog_view> createState() => _Katalog_viewState();
// }

// class _Katalog_viewState extends State<Katalog_view> {
//   late Future<List<TanamanModel>> _tanamanFuture;

//   @override
//   void initState() {
//     super.initState();
//     _tanamanFuture = getTanaman(); // Mengambil data tanaman dari API
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const KatalogTanamanView(),
//                 const SizedBox(height: 30),
//                 // Menggunakan FutureBuilder untuk memuat data tanaman
//                 FutureBuilder<List<TanamanModel>>(
//                   future: _tanamanFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return const Center(child: Text('Tidak ada tanaman obat.'));
//                     } else {
//                       // Data berhasil didapat, tampilkan grid
//                       final tanamanObat = snapshot.data!;
//                       return GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                         ),
//                         itemBuilder: (context, index) => View_tanaman(
//                           tanaman: tanamanObat[index],
//                         ),
//                         itemCount: tanamanObat.length,
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class KatalogTanamanView extends StatelessWidget {
//   const KatalogTanamanView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           style: IconButton.styleFrom(
//             backgroundColor: Color.fromARGB(255, 229, 227, 227),
//             fixedSize: const Size(55, 55),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//           color: Colors.black,
//           icon: const Icon(CupertinoIcons.chevron_back),
//         ),
//         const Spacer(),
//         const Text(
//           "Katalog Tanaman Obat",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Spacer(),
//       ],
//     );
//   }
// }
