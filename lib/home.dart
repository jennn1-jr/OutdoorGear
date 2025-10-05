import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'data/camping_data.dart'; // Pastikan path ini benar
import 'models/camping_item.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String password;
  const HomePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    String username = email.contains('@') ? email.split('@')[0] : email;

    final List<Map<String, dynamic>> categories = [
      {'gambar': 'assets/images/Tenda.png', 'name': 'Tenda', 'filter': 'Tenda'},
      {'gambar': 'assets/images/Sepatu.png', 'name': 'Sepatu', 'filter': 'Sepatu'},
      {'gambar': 'assets/images/Hydropack.png', 'name': 'Tas', 'filter': 'Carrier'},
      {'gambar': 'assets/images/sleepingbag.png', 'name': 'Alat Tidur', 'filter': 'Sleeping Bag'},
    ];

    final List<String> categoryItemNames = categories.map((cat) => cat['filter'] as String).toList();
    final List<CampingItem> otherItems = campingList
        .where((item) => !categoryItemNames.any((catName) => item.nama.contains(catName)))
        .toList();

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 220).floor().clamp(2, 6); // Aturan baru untuk grid

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- 1. BAGIAN HEADER (BACKGROUND, SELAMAT DATANG, SEARCH) ---
          SliverToBoxAdapter(
            child: Container(
              height: screenWidth > 600 ? 300 : 220,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Mountain.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer untuk menurunkan posisi teks
                  const Spacer(flex: 2), 
                  Text(
                    "Selamat Datang, $username",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth > 600 ? 32 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   // Spacer untuk memberi jarak dari bawah
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),

          // --- 2. BANNER DISKON (DENGAN GAMBAR LEBIH BESAR) ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Container(
                height: 200, // <-- Tinggi diperbesar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset("assets/images/Outdoor.png", fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
                    const Center(
                      child: Text(
                        "Diskon Pembelian Pertama\n All Sepatu Diskon 25%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // --- 3. KATEGORI (DITENGAHKAN DI DESKTOP) ---
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                // Center widget untuk menempatkan ListView di tengah
                Center(
                  child: SizedBox(
                    height: 120, // <-- Tinggi kontainer diperbesar
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      // ShrinkWrap agar ListView mengambil lebar sesuai isinya
                      shrinkWrap: true, 
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          gambar: categories[index]['gambar'],
                          name: categories[index]['name'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // --- 4. SEMUA PRODUK LAINNYA (GRID RESPONSIVE) ---
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Text("Produk Lainnya", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

// === WIDGET-WIDGET CARD (TIDAK BERUBAH) ===

class ProductCard extends StatelessWidget {
  final CampingItem item;
  const ProductCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: item))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))]
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(item.gambar, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const Spacer(),
                    Text("Rp. ${item.harga.toString()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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

class CategoryCard extends StatelessWidget {
  final String gambar;
  final String name;
  const CategoryCard({super.key, required this.gambar, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // <-- Lebar diperbesar
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 80, // <-- Tinggi diperbesar
            width: 80,  // <-- Lebar diperbesar
            padding: const EdgeInsets.all(12.0), // Padding disesuaikan
            decoration: BoxDecoration(
              color: const Color(0xFFF0F1F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(gambar, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}