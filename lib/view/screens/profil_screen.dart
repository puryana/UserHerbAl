import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/providers/theme_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart'; 
import 'package:unicons/unicons.dart'; 
import 'package:flutter_iconly/flutter_iconly.dart'; 

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(6, 132, 0, 1),
            padding: const EdgeInsets.only(top: 30,),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          themeProvider.setDarkTheme(
                            themeValue: !themeProvider.getIsDarkTheme,
                          );
                        },
                        icon: Icon(
                          themeProvider.getIsDarkTheme
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Iconsax.user, color: Colors.grey, size: 30),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Anjapuryana',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(0.10),
            // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListTile(
              title: Row(
                children: [
                  const Icon(Icons.format_line_spacing, color: Colors.grey),
                  const SizedBox(width: 20),
                  const Text('Pesanan Saya'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Lihat Riwayat Pesanan'),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.chevron_right, size: 18),
                ],
              ),
              onTap: () {
                // Navigasi ke halaman riwayat pesanan
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                OrderStatusWidget(Iconsax.money_add, "Belum Bayar"),
                OrderStatusWidget(Iconsax.repeat, "Diproses"),
                OrderStatusWidget(Iconsax.box, "Dikemas"),
                OrderStatusWidget(Iconsax.truck, "Dikirim"),
                OrderStatusWidget(Iconsax.tick_circle, "Selesai"),
              ],
            ),
          ),
          
          const Divider(),
          ListTile(
            leading: const Icon(UniconsLine.heart),
            title: const Text('Favorit Saya'),
            trailing: const Icon(CupertinoIcons.chevron_right, size: 18),
            onTap: () {
              // Navigasi ke halaman Favorit
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.timeCircle),
            title: const Text('Riwayat Pencarian'),
            trailing: const Icon(CupertinoIcons.chevron_right, size: 18),
            onTap: () {
              // Navigasi ke halaman Riwayat Pencarian
            },
          ),
          const Divider(),
          // Tombol Keluar
          ListTile(
            leading: const Icon(Iconsax.logout),
            title: const Text('Keluar'),
            trailing: const Icon(CupertinoIcons.chevron_right, size: 18),
            onTap: () {
              // Logika logout di sini
            },
          ),
        ],
      ),
    ); 
  }
}

class OrderStatusWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const OrderStatusWidget(this.icon, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.grey),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
