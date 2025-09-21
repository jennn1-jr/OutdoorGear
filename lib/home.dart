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
    String password = args?['password'] ?? '';
    if (email.isEmpty) {
      email = "User";
    }
    
    String username = email.contains('@') ? email.split('@')[0] : email;

    return Scaffold(
      backgroundColor: Colors.grey[100], // Background keseluruhan tetap abu-abu
      body: CustomScrollView(
        slivers: [
          // --- 1. SLIVER APP BAR SEBAGAI BANNER HEADER ---
          SliverAppBar(
            backgroundColor: Colors.transparent, // AppBar transparan
            foregroundColor:
                Colors.white, // Warna ikon dan teks default jadi putih
            expandedHeight: 350.0, // Tinggi total area AppBar + banner
            pinned: true, // AppBar akan tetap "nempel" di atas saat di-scroll
            elevation: 0, // Tanpa bayangan
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                // Gunakan Stack untuk menumpuk gambar dan teks
                children: [
                  // Gambar Background
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/background2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Overlay gelap untuk teks lebih jelas
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black
                                .withOpacity(0.5), // Lebih gelap di atas
                            Colors.black.withOpacity(0.2),
                            Colors.black
                                .withOpacity(0.5), // Lebih gelap di bawah
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Konten teks di dalam banner
                  Positioned(
                    left: 16,
                    bottom:
                        16, // Posisikan teks Products dan Selamat Datang di bawah
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Products",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(blurRadius: 5, color: Colors.black54)
                              ]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Selamat Datang, $username 👋",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              shadows: [
                                Shadow(blurRadius: 5, color: Colors.black54)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Judul "OutdoorGear" yang akan muncul saat di-scroll ke atas
              // Jika ingin selalu terlihat di posisi banner, bisa digabung ke dalam Stack di atas
              // Namun untuk mempertahankan gaya AppBar transparan, ini adalah cara yang lebih umum
              // Jika kamu mau OutdoorGear selalu di pojok kiri atas gambar, saya bisa ubah lagi.
            ),
            // Judul "OutdoorGear" di AppBar transparan
            title: const Text(
              "OutdoorGear",
              style: TextStyle(
                  color:
                      Colors.white, // Teks putih agar terlihat di atas gambar
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(blurRadius: 5, color: Colors.black54)
                  ] // Tambah bayangan agar jelas
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile", arguments: {
                      "email": email,
                      "password": password,
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Text(
                      email[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // --- 2. JUDUL "Semua Produk" ---
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

          // --- 3. DAFTAR PRODUK MENGGUNAKAN ListView.builder (WAJIB) ---
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Wajib agar CustomScrollView bisa scroll
              itemCount: campingList.length,
              itemBuilder: (context, index) {
                return ProductListCard(item: campingList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// === WIDGET DESAIN KARTU (TIDAK DIUBAH) ===
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
                    border: Border.all(color: Colors.grey.shade200)),
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
