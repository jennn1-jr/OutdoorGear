import 'package:flutter/material.dart';
import 'data/camping_data.dart';
import 'models/camping_item.dart';
import 'detail_page.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final String categoryFilter;

  const CategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryFilter,
  });

  @override
  Widget build(BuildContext context) {
    final List<CampingItem> categoryItems = campingList
        .where((item) =>
            item.nama.toLowerCase().contains(categoryFilter.toLowerCase()))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // HEADER DENGAN GAMBAR LATAR + SEARCH
          SliverAppBar(
            expandedHeight: 220.0,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF172554),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/Mountain.png",
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                  ),
                  // Konten dalam header → diperbaiki agar tidak overflow
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            "Home > $categoryName",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: "Search in this category...",
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
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

          // GRID PRODUK
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
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

// KARTU PRODUK
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
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(item.gambar,
                    width: double.infinity, fit: BoxFit.cover),
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
                    Text("Rp. ${item.harga.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
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
