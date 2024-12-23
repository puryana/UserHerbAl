// import 'package:herbal/core/models/kategori_model.dart';

// class Ramuan_tradisional {

//   static List<KategoriModel> ramuanList = [
//     KategoriModel(
//       id: "1",
//       nama_ramuan: "Jamu",
//       img: "assets/ramuan/jamuu.png",
//     ),
//     KategoriModel(
//       id: "2",
//       nama_ramuan: "Parem",
//       img: "assets/ramuan/parem.png",
//     ),
//     KategoriModel(
//       id: "3",
//       nama_ramuan: "Minyak",
//       img: "assets/ramuan/minyak.png",
//     ),
//     KategoriModel(
//       id: "4",
//       nama_ramuan: "Pepeh",
//       img: "assets/ramuan/minyak.png",
//     ),
    
//     KategoriModel(
//       id: "5",
//       nama_ramuan: "Oles",
//       img: "assets/ramuan/minyak.png",
//     ),
//   ];
// }
// final List<String> ramuanOptions = [
//   "Jamu (loloh)",
//   "Boreh (parem)",
//   "Pepeh (tutuh)",
//   "Minyak (lengis)",
//   "Oles",
// ];

// class RamuanDetail {
//   final String img;
//   final String nama;
//   final String deskripsi;
//   final String manfaat;
//   final String efekSamping;
//   final String waktuKonsumsi;
//   final String saranPenggunaan;
//   final String bahan;
//   final String langkah;

//   RamuanDetail({
//     required this.img,
//     required this.nama,
//     required this.deskripsi,
//     required this.manfaat,
//     required this.efekSamping,
//     required this.waktuKonsumsi,
//     required this.saranPenggunaan,
//     required this.bahan,
//     required this.langkah,
//   });
// }

// final Map<String, List<RamuanDetail>> ramuanDetails = {
//   "Jamu (loloh)": [
//     RamuanDetail(
//       img : "assets/ramuan/jamu.jpg",
//       nama: "Jamu Beras Kencur",
//       deskripsi: "Jamu Beras Kencur adalah minuman tradisional yang terbuat dari bahan utama beras dan kencur. Minuman ini memiliki rasa yang segar dan berkhasiat untuk menyehatkan tubuh serta meningkatkan daya tahan tubuh.",
//       manfaat: "Manfaat:\n- Meredakan masuk angin\n- Mempercepat proses pencernaan\n- Menyegarkan badan",
//       efekSamping: "Efek Samping:\n- Tidak dianjurkan untuk penderita maag\n- Mengkonsumsi dalam jumlah berlebihan dapat menyebabkan mulas",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja sesuai kebutuhan, namun sebaiknya tidak saat perut kosong",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi dua kali sehari setelah makan\n- Jangan melebihi dosis yang dianjurkan",
//       bahan: "Bahan-bahan:\n- 50 gram beras\n- 20 gram kencur\n- 1 liter air\n- Gula merah secukupnya",
//       langkah: "Langkah-langkah Pembuatan Jamu Beras Kencur:\n1. Cuci bersih beras dan kencur.\n 2. Rebus beras dan kencur dalam air hingga mendidih dan air berkurang setengahnya.\n3. Saring air rebusan beras dan kencur.\n4. Tambahkan gula merah secukupnya dan aduk hingga larut.\n5. Sajikan dalam keadaan hangat atau dingin.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/jamu.jpg",
//       nama: "Jamu Kunyit Asam",
//       deskripsi: "Jamu Kunyit Asam adalah minuman tradisional yang terbuat dari campuran kunyit, asam Jawa, air, dan gula. Minuman ini memiliki rasa yang segar dan berkhasiat untuk menyehatkan tubuh serta meningkatkan daya tahan tubuh.",
//       manfaat: "Manfaat:\n- Menyehatkan pencernaan\n- Meningkatkan daya tahan tubuh\n- Mengurangi peradangan dalam tubuh",
//       efekSamping: "Efek Samping:\n- Tidak dianjurkan untuk penderita maag\n- Dapat menyebabkan alergi pada beberapa individu yang sensitif terhadap kunyit",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja sesuai kebutuhan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi satu kali sehari atau sesuai kebutuhan\n- Konsultasikan dengan ahli kesehatan sebelum mengonsumsi secara teratur",
//       bahan: "Bahan-bahan:\n• Kunyit\n• Asam Jawa\n• Air\n• Gula",
//       langkah: "Langkah-langkah Pembuatan Jamu Kunyit Asam:\n1. Siapkan bahan-bahan yang diperlukan.\n2. Kupas dan cuci bersih kunyit, kemudian parut halus.\n3. Peras air asam Jawa.\n4. Rebus kunyit parut dengan air hingga mendidih.\n5. Tambahkan air asam Jawa dan gula secukupnya, aduk hingga rata.\n6. Saring ramuan dan sajikan dalam keadaan hangat.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/jamu.jpg",
//       nama: "Loloh Cemceman",
//       deskripsi: "Loloh Cemceman adalah minuman tradisional yang terbuat dari daun cemceman, air, dan gula. Minuman ini memiliki rasa yang segar dan berkhasiat untuk menyehatkan tubuh serta menyegarkan pikiran.",
//       manfaat: "Manfaat:\n- Menyegarkan pikiran\n- Menyehatkan tubuh\n- Membantu meredakan panas dalam",
//       efekSamping: "Efek Samping:\n- Tidak dianjurkan untuk penderita maag\n- Dapat menyebabkan alergi pada beberapa individu yang sensitif terhadap daun cemceman",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja sesuai kebutuhan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi satu kali sehari untuk mendapatkan efek yang optimal\n- Hindari konsumsi berlebihan",
//       bahan: "Bahan-bahan:\n• Daun cemceman\n• Air\n• Gula",
//       langkah: "Langkah-langkah Pembuatan Loloh Cemceman:\n1. Siapkan daun cemceman yang sudah dicuci bersih.\n2. Rebus daun cemceman dengan air hingga mendidih.\n3. Tambahkan gula secukupnya dan aduk hingga larut.\n4. Saring ramuan dan dinginkan sebelum disajikan.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/jamu.jpg",
//       nama: "Loloh Boncem",
//       deskripsi: "Loloh Boncem adalah minuman tradisional yang terbuat dari daun boncem, air, dan gula. Minuman ini memiliki rasa yang segar dan berkhasiat untuk menyehatkan tubuh serta menyegarkan tenggorokan.",
//       manfaat: "Manfaat:\n- Menyegarkan tenggorokan\n- Menyehatkan tubuh\n- Membantu meredakan batuk",
//       efekSamping: "Efek Samping:\n- Tidak dianjurkan untuk penderita maag\n- Dapat menyebabkan alergi pada beberapa individu yang sensitif terhadap daun boncem",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja sesuai kebutuhan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi saat tenggorokan terasa kering atau saat batuk\n- Jangan melebihi dosis yang dianjurkan",
//       bahan: "Bahan-bahan:\n• Daun boncem\n• Air\n• Gula",
//       langkah: "Langkah-langkah Pembuatan Loloh Boncem:\n1. Siapkan daun boncem yang sudah dicuci bersih.\n2. Rebus daun boncem dengan air hingga mendidih.\n3. Tambahkan gula secukupnya dan aduk hingga larut.\n4. Saring ramuan dan dinginkan sebelum disajikan.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/jamu.jpg",
//       nama: "Loloh Meniran",
//       deskripsi: "Loloh Meniran adalah minuman tradisional yang terbuat dari daun meniran, air, dan gula. Minuman ini memiliki rasa yang segar dan berkhasiat untuk menyehatkan tubuh serta menjaga kesehatan.",
//       manfaat: "Manfaat:\n- Menjaga kesehatan tubuh secara keseluruhan\n- Menyehatkan sistem pencernaan\n- Membantu mengatasi masalah perut",
//       efekSamping: "Efek Samping:\n- Tidak dianjurkan untuk penderita maag\n- Dapat menyebabkan alergi pada beberapa individu yang sensitif terhadap daun meniran",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja sesuai kebutuhan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi secara teratur untuk mendapatkan manfaat yang optimal\n- Jika mengalami gangguan pencernaan setelah mengonsumsi, hentikan penggunaan dan konsultasikan dengan ahli kesehatan",
//       bahan: "Bahan-bahan:\n• Daun meniran\n• Air\n• Gula",
//       langkah: "Langkah-langkah Pembuatan Loloh Meniran:\n1. Siapkan daun meniran yang sudah dicuci bersih.\n2. Rebus daun meniran dengan air hingga mendidih.\n3. Tambahkan gula secukupnya dan aduk hingga larut.\n4. Saring ramuan dan dinginkan sebelum disajikan.",
//     ),
  
//   ],
//   "Boreh (parem)": [
//     RamuanDetail(
//       img :"assets/ramuan/boreh.jpg",
//       nama: "Boreh Panas",
//       deskripsi: "Boreh Panas adalah ramuan tradisional Bali yang digunakan untuk menghangatkan tubuh dan meredakan pegal-pegal setelah beraktivitas. Ramuan ini terbuat dari campuran rempah-rempah seperti jahe, lengkuas, kayu manis, cengkeh, kapulaga, dan gula aren.",
//       manfaat: "Manfaat:\n- Menghangatkan tubuh\n- Meredakan pegal-pegal\n- Meningkatkan sirkulasi darah",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan, namun bagi beberapa individu dapat menyebabkan reaksi alergi ringan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya digunakan pada malam hari sebelum tidur",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan ramuan ini ke seluruh tubuh, pijat perlahan, dan biarkan selama beberapa saat sebelum mandi",
//       bahan: "Bahan-bahan:\n• Jahe\n• Lengkuas\n• Kayu manis\n• Cengkeh\n• Kapulaga\n• Gula aren",
//       langkah: "Langkah-langkah Pembuatan Boreh Panas:\n1. Haluskan semua bahan rempah-rempah ke dalam bentuk pasta.\n2. Campurkan dengan gula aren hingga merata.\n3. Panaskan campuran dengan sedikit air hingga mendidih.\n4. Gunakan ramuan ini untuk pijat seluruh tubuh.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/boreh.jpg",
//       nama: "Boreh Dingin",
//       deskripsi: "Boreh Dingin adalah ramuan tradisional Bali yang digunakan untuk menyegarkan tubuh dan memberikan rasa nyaman pada kulit. Ramuan ini terbuat dari campuran kayu secang, sirih, daun pandan, air kelapa, dan gula aren.",
//       manfaat: "Manfaat:\n- Menyegarkan tubuh\n- Melembutkan dan memberikan kesegaran pada kulit\n- Memberikan aroma yang menenangkan",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat digunakan setiap saat, terutama pada cuaca panas",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan ramuan ini secara merata pada seluruh tubuh setelah mandi",
//       bahan: "Bahan-bahan:\n• Kayu secang\n• Sirih\n• Daun pandan\n• Air kelapa\n• Gula aren",
//       langkah: "Langkah-langkah Pembuatan Boreh Dingin:\n1. Haluskan semua bahan menjadi pasta.\n2. Campurkan dengan air kelapa dan gula aren hingga merata.\n3. Biarkan campuran tersebut dalam kulkas hingga dingin.\n4. Gunakan ramuan ini sebagai losion pada kulit setelah mandi.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/boreh.jpg",
//       nama: "Boreh Kencur",
//       deskripsi: "Boreh Kencur adalah ramuan tradisional Bali yang digunakan untuk menghangatkan tubuh dan meningkatkan energi. Ramuan ini terbuat dari campuran kencur, jahe, temulawak, lengkuas, kunyit, dan gula aren.",
//       manfaat: "Manfaat:\n- Menghangatkan tubuh\n- Meningkatkan energi\n- Meredakan pegal-pegal",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat digunakan setiap saat, terutama saat tubuh terasa lelah atau pegal-pegal",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan ramuan ini ke seluruh tubuh, pijat perlahan, dan biarkan selama beberapa saat sebelum mandi",
//       bahan: "Bahan-bahan:\n• Kencur\n• Jahe\n• Temulawak\n• Lengkuas\n• Kunyit\n• Gula aren",
//       langkah: "Langkah-langkah Pembuatan Boreh Kencur:\n1. Haluskan semua bahan rempah-rempah ke dalam bentuk pasta.\n2. Campurkan dengan gula aren hingga merata.\n3. Panaskan campuran dengan sedikit air hingga mendidih.\n4. Gunakan ramuan ini untuk pijat seluruh tubuh.",
//     ),
//     RamuanDetail(
//       img :"assets/ramuan/boreh.jpg",
//       nama: "Boreh Temulawak",
//       deskripsi: "Boreh Temulawak adalah ramuan tradisional Bali yang digunakan untuk mengurangi rasa pegal-pegal dan meningkatkan sirkulasi darah. Ramuan ini terbuat dari campuran temulawak, jahe, lengkuas, kapulaga, cengkeh, dan gula aren.",
//       manfaat: "Manfaat:\n- Meredakan pegal-pegal\n- Meningkatkan sirkulasi darah\n- Memberikan efek relaksasi pada tubuh",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya digunakan pada sore atau malam hari setelah aktivitas berat",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan ramuan ini ke bagian tubuh yang terasa pegal-pegal, kemudian pijat perlahan untuk meresapkan khasiatnya",
//       bahan: "Bahan-bahan:\n• Temulawak\n• Jahe\n• Lengkuas\n• Kapulaga\n• Cengkeh\n• Gula aren",
//       langkah: "Langkah-langkah Pembuatan Boreh Temulawak:\n1. Haluskan semua bahan rempah-rempah ke dalam bentuk pasta.\n2. Campurkan dengan gula aren hingga merata.\n3. Panaskan campuran dengan sedikit air hingga mendidih.\n4. Gunakan ramuan ini untuk pijat pada bagian tubuh yang terasa pegal-pegal."
//     ),
//   ],
//   "Pepeh (tutuh)" :[
//     RamuanDetail(
//       img: "assets/ramuan/tetes.jpg",
//       nama: "Tutuh Beras",
//       deskripsi: "Tutuh Beras adalah minuman tradisional Bali yang terbuat dari beras dan bahan-bahan alami lainnya. Minuman ini memiliki rasa yang lembut dan berkhasiat untuk menyegarkan tubuh serta memberikan energi tambahan.",
//       manfaat: "Manfaat:\n- Memberikan energi tambahan\n- Menghilangkan rasa haus\n- Meredakan panas dalam tubuh",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja, terutama saat tubuh merasa lelah atau haus",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi dalam keadaan hangat atau dingin sesuai selera",
//       bahan: "Bahan-bahan:\n• Beras\n• Air\n• Gula aren\n• Santan",
//       langkah: "Langkah-langkah Pembuatan Tutuh Beras:\n1. Rendam beras dalam air selama beberapa jam.\n2. Tumbuk atau haluskan beras hingga menjadi bubur.\n3. Rebus beras bubur dengan air hingga matang.\n4. Tambahkan gula aren dan santan, aduk hingga rata.\n5. Saring dan sajikan dalam keadaan hangat atau dingin."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/tetes.jpg",
//       nama: "Tutuh Jeruk Nipis",
//       deskripsi: "Tutuh Jeruk Nipis adalah minuman tradisional Bali yang terbuat dari jeruk nipis dan bahan-bahan alami lainnya. Minuman ini memiliki rasa segar dan berkhasiat untuk menyegarkan tubuh serta meningkatkan sistem kekebalan tubuh.",
//       manfaat: "Manfaat:\n- Meningkatkan sistem kekebalan tubuh\n- Membantu melawan penyakit\n- Memberikan efek penyegaran",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya diminum saat perut kosong atau setelah makan",
//       saranPenggunaan: "Saran Penggunaan:\n- Hindari konsumsi berlebihan untuk menghindari iritasi pada lambung",
//       bahan: "Bahan-bahan:\n• Jeruk nipis\n• Air\n• Gula aren\n• Es batu",
//       langkah: "Langkah-langkah Pembuatan Tutuh Jeruk Nipis:\n1. Peras jeruk nipis untuk mendapatkan airnya.\n2. Campurkan air jeruk nipis dengan air dan gula aren, aduk hingga larut.\n3. Tambahkan es batu sesuai selera.\n4. Sajikan dalam gelas dan nikmati."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/tetes.jpg",
//       nama: "Tutuh Kunyit",
//       deskripsi: "Tutuh Kunyit adalah minuman tradisional Bali yang terbuat dari kunyit dan bahan-bahan alami lainnya. Minuman ini memiliki rasa segar dan berkhasiat untuk membersihkan racun dalam tubuh serta meningkatkan sistem pencernaan.",
//       manfaat: "Manfaat:\n- Membersihkan racun dalam tubuh\n- Meningkatkan sistem pencernaan\n- Meredakan gangguan pencernaan",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja, terutama saat perut kosong atau setelah makan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi secara teratur untuk hasil yang maksimal",
//       bahan: "Bahan-bahan:\n• Kunyit\n• Air\n• Gula aren\n• Es batu",
//       langkah: "Langkah-langkah Pembuatan Tutuh Kunyit:\n1. Parut kunyit hingga halus.\n2. Peras kunyit yang telah diparut untuk mendapatkan airnya.\n3. Campurkan air kunyit dengan air dan gula aren, aduk hingga larut.\n4. Tambahkan es batu sesuai selera.\n5. Sajikan dan nikmati."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/tetes.jpg",
//       nama: "Tutuh Belimbing",
//       deskripsi: "Tutuh Belimbing adalah minuman tradisional Bali yang terbuat dari buah belimbing dan bahan-bahan alami lainnya. Minuman ini memiliki rasa segar dan berkhasiat untuk menyegarkan tubuh serta meningkatkan sistem pencernaan.",
//       manfaat: "Manfaat:\n- Menyegarkan tubuh\n- Meningkatkan sistem pencernaan\n- Mengandung antioksidan alami",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat diminum kapan saja, terutama saat perut kosong atau setelah makan",
//       saranPenggunaan: "Saran Penggunaan:\n- Konsumsi secara rutin untuk mendapatkan manfaat yang optimal",
//       bahan: "Bahan-bahan:\n• Belimbing\n• Air\n• Gula aren\n• Es batu",
//       langkah: "Langkah-langkah Pembuatan Tutuh Belimbing:\n1. Potong belimbing menjadi bagian kecil-kecil.\n2. Haluskan belimbing hingga menjadi jus.\n3. Campurkan jus belimbing dengan air dan gula aren, aduk hingga larut.\n4. Tambahkan es batu sesuai selera.\n5. Sajikan dan nikmati."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/tetes.jpg",
//       nama: "Tutuh Bunga Kenanga",
//       deskripsi: "Tutuh Bunga Kenanga adalah minuman tradisional Bali yang terbuat dari bunga kenanga dan bahan-bahan alami lainnya. Minuman ini memiliki aroma yang harum dan berkhasiat untuk menenangkan pikiran serta meredakan stres.",
//       manfaat: "Manfaat:\n- Menenangkan pikiran\n- Meredakan stres dan kecemasan\n- Menghilangkan rasa gelisah",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya diminum pada saat santai atau sebelum tidur untuk menciptakan suasana yang tenang",
//       saranPenggunaan: "Saran Penggunaan:\n- Nikmati minuman ini dalam keadaan tenang untuk mendapatkan manfaat relaksasi yang optimal",
//       bahan: "Bahan-bahan:\n• Bunga kenanga\n• Air\n• Gula aren\n• Es batu",
//       langkah: "Langkah-langkah Pembuatan Tutuh Bunga Kenanga:\n1. Rendam bunga kenanga dalam air selama beberapa jam.\n2. Saring air rendaman bunga kenanga untuk mendapatkan ekstrak airnya.\n3. Campurkan ekstrak air bunga kenanga dengan air dan gula aren, aduk hingga larut.\n4. Tambahkan es batu sesuai selera.\n5. Sajikan dan nikmati aroma harum dari minuman ini."
//     ),
//   ],
//   "Minyak (lengis)" : [
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Lengis Kelapa",
//       deskripsi: "Lengis Kelapa adalah minyak tradisional Bali yang diekstraksi dari kelapa muda. Minyak ini memiliki aroma yang segar dan berkhasiat untuk melembutkan kulit serta menjaga kelembapan alami kulit.",
//       manfaat: "Manfaat:\n- Melembutkan kulit\n- Menjaga kelembapan alami kulit\n- Mengandung nutrisi penting bagi kulit",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya digunakan setelah mandi atau sebelum tidur",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan minyak kelapa pada seluruh tubuh secara merata, pijat perlahan untuk meresapkan minyak",
//       bahan: "Bahan:\n• Kelapa muda",
//       langkah: "Langkah-langkah Pembuatan Lengis Kelapa:\n1. Ambil kelapa muda dan peras hingga menghasilkan minyak.\n2. Saring minyak kelapa untuk mendapatkan minyak murni.\n3. Simpan dalam wadah kedap udara.",
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Minyak Kayu Putih",
//       deskripsi: "Minyak Kayu Putih adalah minyak esensial tradisional Bali yang diekstraksi dari daun kayu putih. Minyak ini memiliki aroma yang menyegarkan dan berkhasiat untuk meredakan nyeri otot serta mengatasi gangguan pernapasan.",
//       manfaat: "Manfaat:\n- Meredakan nyeri otot\n- Mengatasi gangguan pernapasan seperti pilek dan batuk\n- Memberikan efek relaksasi",
//       efekSamping: "Efek Samping:\n- Penggunaan berlebihan dapat menyebabkan iritasi pada kulit",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Idealnya digunakan pada malam hari sebelum tidur untuk menciptakan suasana relaksasi",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan minyak kayu putih pada area yang terasa nyeri atau pada dada untuk membantu meredakan gangguan pernapasan",
//       bahan: "Bahan:\n• Daun kayu putih",
//       langkah: "Langkah-langkah Pembuatan Minyak Kayu Putih:\n1. Rendam daun kayu putih dalam minyak nabati selama beberapa hari.\n2. Proses ekstraksi menggunakan metode penyulingan.\n3. Saring minyak untuk mendapatkan minyak kayu putih murni.",
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Minyak Cengkeh",
//       deskripsi: "Minyak Cengkeh adalah minyak esensial tradisional Bali yang diekstraksi dari bunga cengkeh. Minyak ini memiliki aroma yang khas dan berkhasiat untuk meredakan nyeri gigi serta memberikan efek penyegaran pada napas.",
//       manfaat: "Manfaat:\n- Meredakan nyeri gigi\n- Memberikan efek penyegaran pada napas\n- Membantu meredakan sakit kepala",
//       efekSamping: "Efek Samping:\n- Penggunaan berlebihan dapat menyebabkan iritasi pada kulit atau selaput lendir",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan minyak cengkeh pada gigi yang terasa nyeri atau gunakan sebagai aromaterapi dengan menghirup aroma minyak cengkeh.",
//       bahan: "Bahan:\n• Bunga cengkeh",
//       langkah: "Langkah-langkah Pembuatan Minyak Cengkeh:\n1. Rendam bunga cengkeh dalam minyak nabati selama beberapa hari.\n2. Proses ekstraksi menggunakan metode penyulingan.\n3. Saring minyak untuk mendapatkan minyak cengkeh murni.",
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Minyak Serai",
//       deskripsi: "Minyak Serai adalah minyak esensial tradisional Bali yang diekstraksi dari batang dan daun serai. Minyak ini memiliki aroma segar dan berkhasiat untuk mengusir nyamuk serta memberikan efek relaksasi.",
//       manfaat: "Manfaat:\n- Mengusir nyamuk dan serangga lainnya\n- Memberikan efek relaksasi\n- Membantu mengatasi stres dan kegelisahan",
//       efekSamping: "Efek Samping:\n- Penggunaan berlebihan dapat menyebabkan iritasi pada kulit",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan beberapa tetes minyak serai pada kulit untuk mengusir nyamuk, atau gunakan sebagai aromaterapi dengan menghirup aroma minyak serai.",
//       bahan: "Bahan:\n• Batang dan daun serai",
//       langkah: "Langkah-langkah Pembuatan Minyak Serai:\n1. Potong batang dan daun serai menjadi bagian kecil-kecil.\n2. Rendam potongan serai dalam minyak nabati selama beberapa hari.\n3. Proses ekstraksi menggunakan metode penyulingan.\n4. Saring minyak untuk mendapatkan minyak serai murni."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Minyak Jinten",
//       deskripsi: "Minyak Jinten adalah minyak esensial tradisional Bali yang diekstraksi dari biji jinten. Minyak ini memiliki aroma yang hangat dan berkhasiat untuk meredakan gangguan pencernaan serta mengurangi rasa kembung.",
//       manfaat: "Manfaat:\n- Meredakan gangguan pencernaan\n- Mengurangi rasa kembung\n- Membantu meningkatkan nafsu makan",
//       efekSamping: "Efek Samping:\n- Penggunaan berlebihan dapat menyebabkan iritasi pada kulit",
//       waktuKonsumsi: "Waktu Konsumsi:\n- Dapat digunakan kapan saja saat mengalami gangguan pencernaan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan beberapa tetes minyak jinten pada perut atau gunakan sebagai aromaterapi dengan menghirup aroma minyak jinten.",
//       bahan: "Bahan:\n• Biji jinten",
//       langkah: "Langkah-langkah Pembuatan Minyak Jinten:\n1. Rendam biji jinten dalam minyak nabati selama beberapa hari.\n2. Proses ekstraksi menggunakan metode penyulingan.\n3. Saring minyak untuk mendapatkan minyak jinten murni."
//     ),
//   ],
//   "Oles" : [
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Salep Kayu Putih",
//       deskripsi: "Salep Kayu Putih adalah salep tradisional Bali yang terbuat dari ekstrak kayu putih dan bahan-bahan alami lainnya. Salep ini memiliki kandungan yang berkhasiat untuk meredakan nyeri otot, mengatasi gatal-gatal, dan memberikan efek penyegaran pada kulit.",
//       manfaat: "Manfaat:\n- Meredakan nyeri otot\n- Mengatasi gatal-gatal pada kulit\n- Memberikan efek penyegaran",
//       efekSamping: "Efek Samping:\n- Penggunaan berlebihan dapat menyebabkan iritasi pada kulit",
//       waktuKonsumsi: "Waktu Penggunaan:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan salep secara merata pada area yang membutuhkan perawatan kulit.",
//       bahan: "Bahan:\n• Ekstrak kayu putih\n• Minyak kelapa\n• Beeswax\n• Minyak esensial pilihan",
//       langkah: "Langkah-langkah Pembuatan Salep Kayu Putih:\n1. Campurkan ekstrak kayu putih, minyak kelapa, dan beeswax dalam wadah tahan panas.\n2. Panaskan campuran tersebut hingga beeswax larut sepenuhnya.\n3. Tambahkan minyak esensial pilihan untuk meningkatkan aroma dan manfaat salep.\n4. Tuangkan campuran ke dalam wadah yang bersih dan kedap udara.\n5. Biarkan salep mendingin dan mengeras sebelum penggunaan."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Salep Daun Sirih",
//       deskripsi: "Salep Daun Sirih adalah salep tradisional Bali yang terbuat dari ekstrak daun sirih dan bahan-bahan alami lainnya. Salep ini memiliki kandungan yang berkhasiat untuk mengatasi infeksi kulit, meredakan peradangan, dan memberikan efek segar pada kulit.",
//       manfaat: "Manfaat:\n- Mengatasi infeksi kulit\n- Meredakan peradangan\n- Memberikan efek segar",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Penggunaan:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan salep secara merata pada area yang terkena infeksi kulit atau peradangan.",
//       bahan: "Bahan:\n• Ekstrak daun sirih\n• Minyak kelapa\n• Beeswax\n• Minyak esensial pilihan",
//       langkah: "Langkah-langkah Pembuatan Salep Daun Sirih:\n1. Campurkan ekstrak daun sirih, minyak kelapa, dan beeswax dalam wadah tahan panas.\n2. Panaskan campuran tersebut hingga beeswax larut sepenuhnya.\n3. Tambahkan minyak esensial pilihan untuk meningkatkan aroma dan manfaat salep.\n4. Tuangkan campuran ke dalam wadah yang bersih dan kedap udara.\n5. Biarkan salep mendingin dan mengeras sebelum penggunaan."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Salep Minyak Jarak",
//       deskripsi: "Salep Minyak Jarak adalah salep tradisional Bali yang terbuat dari minyak jarak dan bahan-bahan alami lainnya. Salep ini memiliki kandungan yang berkhasiat untuk melembapkan kulit, mengurangi peradangan, dan membantu proses penyembuhan luka.",
//       manfaat: "Manfaat:\n- Melembapkan kulit\n- Mengurangi peradangan\n- Membantu proses penyembuhan luka",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Penggunaan:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan salep secara merata pada area kulit yang membutuhkan perawatan atau perlindungan.",
//       bahan: "Bahan:\n• Minyak jarak\n• Minyak kelapa\n• Beeswax\n• Minyak esensial pilihan",
//       langkah: "Langkah-langkah Pembuatan Salep Minyak Jarak:\n1. Campurkan minyak jarak, minyak kelapa, dan beeswax dalam wadah tahan panas.\n2. Panaskan campuran tersebut hingga beeswax larut sepenuhnya.\n3. Tambahkan minyak esensial pilihan untuk meningkatkan aroma dan manfaat salep.\n4. Tuangkan campuran ke dalam wadah yang bersih dan kedap udara.\n5. Biarkan salep mendingin dan mengeras sebelum penggunaan."
//     ),
//     RamuanDetail(
//       img: "assets/ramuan/oles.jpg",
//       nama: "Salep Minyak Jintan Hitam",
//       deskripsi: "Salep Minyak Jintan Hitam adalah salep tradisional Bali yang terbuat dari minyak jintan hitam dan bahan-bahan alami lainnya. Salep ini memiliki kandungan yang berkhasiat untuk meredakan nyeri sendi, mengurangi peradangan, dan mempercepat proses penyembuhan.",
//       manfaat: "Manfaat:\n- Meredakan nyeri sendi\n- Mengurangi peradangan\n- Mempercepat proses penyembuhan",
//       efekSamping: "Efek Samping:\n- Tidak ditemukan efek samping yang signifikan",
//       waktuKonsumsi: "Waktu Penggunaan:\n- Dapat digunakan kapan saja saat diperlukan",
//       saranPenggunaan: "Saran Penggunaan:\n- Oleskan salep secara merata pada area yang terasa nyeri atau mengalami peradangan.",
//       bahan: "Bahan:\n• Minyak jintan hitam\n• Minyak kelapa\n• Beeswax\n• Minyak esensial pilihan",
//       langkah: "Langkah-langkah Pembuatan Salep Minyak Jintan Hitam:\n1. Campurkan minyak jintan hitam, minyak kelapa, dan beeswax dalam wadah tahan panas.\n2. Panaskan campuran tersebut hingga beeswax larut sepenuhnya.\n3. Tambahkan minyak esensial pilihan untuk meningkatkan aroma dan manfaat salep.\n4. Tuangkan campuran ke dalam wadah yang bersih dan kedap udara.\n5. Biarkan salep mendingin dan mengeras sebelum penggunaan."
//     ),
//   ]
// };







// final Map<String, List<String>> ramuanDetails = {
//   "Jamu (loloh)": [
//     "Jamu Beras Kencur",
//     "Jamu Kunyit Asam",
//     "Loloh Cemceman",
//     "Loloh Boncem",
//     "Loloh Meniran",
//     "Loloh Mimba",
//     "Loloh Sembung",
//   ],
//   "Boreh (parem)": [
//     "Boreh Panas",
//     "Boreh Dingin",
//     "Boreh Kencur",
//     "Boreh Temulawak",
//     "Boreh Kopi",
//     "Boreh Kayu Manis",
//     "Boreh Cendana",
//   ],
//   "Pepeh (tutuh)": [
//     "Tutuh Beras",
//     "Tutuh Jeruk Nipis",
//     "Tutuh Kunyit",
//     "Tutuh Belimbing",
//     "Tutuh Bunga Kenanga",
//   ],
//   "Minyak (lengis)": [
//     "Lengis Kelapa",
//     "Minyak Kayu Putih",
//     "Minyak Cengkeh",
//     "Minyak Serai",
//     "Minyak Jinten",
//   ],
//   "Oles": [
//     "Salep Kayu Putih",
//     "Salep Daun Sirih",
//     "Salep Minyak Jarak",
//     "Salep Minyak Jintan Hitam",
//   ],
// };
