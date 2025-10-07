import 'package:flutter/material.dart';
import 'package:login_app/categories.dart';
import 'detail_page.dart';
import 'data/camping_data.dart'; // Pastikan path ini benar
import 'models/camping_item.dart';
import 'profilpage.dart';
import 'package:intl/intl.dart'; 


final NumberFormat formatRupiah =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);


class HomePage extends StatelessWidget {
  final String email;
  final String password;
  const HomePage({super.key, required this.email, required this.password});


  @override
  Widget build(BuildContext context) {
    String username = email.contains('@') ? email.split('@')[0] : email;

    final List<Map<String, dynamic>> categories = [
      {
        'gambar': 'assets/images/Tenda.png',
        'name': 'Tenda',
        'filter': 'Tenda',
        'gambarLatar': 'assets/images/backgroundtenda.jpg'
      },
      {
        'gambar': 'assets/images/Sepatu.png',
        'name': 'Sepatu',
        'filter': 'Sepatu',
        'gambarLatar': 'assets/images/backgroundsepatu.png'
      },
      {
        'gambar': 'assets/images/carrier60L.png',
        'name': 'Carrier',
        'filter': 'Carrier',
        'gambarLatar': 'assets/images/backgroundcarrier.png'
      },
      {
        'gambar': 'assets/images/jacket1.png',
        'name': 'Jacket',
        'filter': 'Jacket',
        'gambarLatar': 'assets/images/backgroundjacket.jpg'
      },
    ];

    final List<String> categoryItemNames =
        categories.map((cat) => cat['filter'] as String).toList();

    // Logika filter yang sudah benar (case-insensitive)
    final List<CampingItem> otherItems = campingList
        .where((item) => !categoryItemNames.any((catName) =>
            item.nama.toLowerCase().contains(catName.toLowerCase())))
        .toList();

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 220).floor().clamp(2, 6);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- 1. BAGIAN HEADER (DENGAN TAMBAHAN PROFIL) ---
          SliverToBoxAdapter(
            child: Container(
              height: screenWidth > 800 ? 500 : 420,
              // Gunakan Stack untuk menumpuk gambar, konten, dan ikon profil
              child: Stack(
                children: [
                  // Gambar Latar Belakang (paling bawah)
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/Mountain.png",
                      fit: BoxFit.cover,
                      color: Colors.black38,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),

                  // Konten Header (Selamat Datang & Search)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 2),
                        Text("Selamat Datang, $username",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth > 600 ? 32 : 24,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        const TextField(
                            decoration: InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide.none))),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),

                  // ===============================================
                  // 2. TAMBAHAN KODE PROFIL HANYA DI SINI
                  // ===============================================
                  Positioned(
                    top: 40,
                    right: 24,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                email: email,
                                password: password,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: Text(
                            username.isNotEmpty
                                ? username[0].toUpperCase()
                                : 'U',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ===============================================
                ],
              ),
            ),
          ),

          // --- 2. BANNER DISKON (TIDAK BERUBAH) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Container(
                height: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset("assets/images/Outdoor.png",
                            fit: BoxFit.cover)),
                    Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(0.4))),
                    const Center(
                        child: Text(
                            "Diskon Pembelian Pertama\n All Sepatu Diskon 25%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ),

          // --- 3. KATEGORI (TIDAK BERUBAH) ---
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        gambar: categories[index]['gambar']!,
                        name: categories[index]['name']!,
                        filter: categories[index]['filter']!,
                        gambarLatar: categories[index]['gambarLatar']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // --- 4. SEMUA PRODUK LAINNYA (TIDAK BERUBAH) ---
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Text("Produk Lainnya",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: otherItems.length,
              itemBuilder: (context, index) {
                return ProductCard(item: otherItems[index]);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

// === WIDGET CARD PRODUK (STRUKTUR ASLI, TIDAK DIUBAH) ===
class ProductCard extends StatelessWidget {
  final CampingItem item;
  const ProductCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailPage(item: item))),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(item.gambar,
                    width: double.infinity, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.brand,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(item.nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const Spacer(),
                    Text(
                      formatRupiah.format(item.harga),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === WIDGET KATEGORI (STRUKTUR ASLI, TIDAK DIUBAH) ===
class CategoryCard extends StatelessWidget {
  final String gambar;
  final String name;
  final String filter;
  final String gambarLatar;

  const CategoryCard({
    super.key,
    required this.gambar,
    required this.name,
    required this.filter,
    required this.gambarLatar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryName: name,
              categoryFilter: filter,
              categoryBackground: gambarLatar,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F1F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(gambar, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
