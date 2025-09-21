import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'data/camping_data.dart'; // Pastikan path ini benar
import 'models/camping_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Logika pengambilan email tidak diubah
    final args =
        ModalRoute.of(context)!.settings!.arguments as Map<String, String>?;
    String email = args?["email"] ?? "User";
    if (email.isEmpty) {
      email = "User";
    }
    String username = email.contains('@') ? email.split('@')[0] : email;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // --- App Bar (Tidak Diubah) ---
            SliverAppBar(
              backgroundColor: Colors.grey[100],
              floating: true,
              pinned: true,
              elevation: 0,
              title: const Text(
                "OutdoorGear",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF172554),
                    child: Text(
                      email[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // --- HERO BANNER & UCAPAN SELAMAT DATANG (Tidak Diubah) ---
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Products",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Selamat Datang, $username 👋",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // --- JUDUL SEBELUM DAFTAR (Tidak Diubah) ---
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Text(
                  "Semua Produk",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // --- DAFTAR PRODUK MENGGUNAKAN ListView.builder (WAJIB) ---
            SliverToBoxAdapter(
              child: ListView.builder(
                // Properti ini WAJIB agar ListView bisa berada di dalam CustomScrollView
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                
                itemCount: campingList.length,
                itemBuilder: (context, index) {
                  // Kita gunakan widget terpisah untuk desain kartu yang rapi
                  return ProductListCard(item: campingList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === WIDGET DESAIN KARTU (CARD/LISTTILE STYLE) ===
class ProductListCard extends StatelessWidget {
  final CampingItem item;
  const ProductListCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(item: item),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255))
                ),
                child: Image.asset(
                  item.gambar,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.brand,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}