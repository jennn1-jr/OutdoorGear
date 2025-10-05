import 'package:flutter/material.dart';
import 'data/camping_data.dart';
import 'models/camping_item.dart';
import 'detail_page.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final String categoryFilter;
  final String categoryBackground;

  const CategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryFilter,
    required this.categoryBackground,
  });

  @override
  Widget build(BuildContext context) {
    final List<CampingItem> categoryItems = campingList
        .where((item) =>
            item.nama.toLowerCase().contains(categoryFilter.toLowerCase()))
        .toList();
        
    // Cek lebar layar untuk layout responsif
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final crossAxisCount = isDesktop ? 4 : 2; // 4 kolom di desktop, 2 di HP
    final childAspectRatio = isDesktop ? 0.8 : 0.75; // Sesuaikan rasio aspek

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- HEADER (DIPERBESAR & DIBERI EFEK SAMAR) ---
          SliverAppBar(
            expandedHeight: 550.0, // <-- 1. TINGGI HEADER DIPERBESAR
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF172554),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    categoryBackground,
                    fit: BoxFit.cover,
                  ),
                  // Overlay Gradien untuk efek samar
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      )
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- 3. EFEK SAMAR/TRANSPARAN ---
                          Opacity(
                            opacity: 0.50, // <-- Atur tingkat transparansi di sini
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Home > $categoryName",
                                  style: const TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  categoryName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search in this category...",
                                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- GRID PRODUK (UKURAN KARTU DISESUAIKAN) ---
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // Jumlah kolom responsif
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: childAspectRatio, // <-- 2. RASIO KARTU DIPERBAIKI
              ),
              itemCount: categoryItems.length,
              itemBuilder: (context, index) {
                return ProductCard(item: categoryItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// KARTU PRODUK (tidak berubah)
class ProductCard extends StatelessWidget {
  final CampingItem item;
  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage(item: item)),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(item.gambar,
                    width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.brand,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(item.nama,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16), // Font diperbesar sedikit
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                   const SizedBox(height: 8),
                  Text("Rp. ${item.harga.toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepOrange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}