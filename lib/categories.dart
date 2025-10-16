import 'package:flutter/material.dart';
import 'data/camping_data.dart';
import 'models/camping_item.dart';
import 'detail_page.dart';
import 'package:intl/intl.dart';

final NumberFormat formatRupiah =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

class CategoryPage extends StatefulWidget {
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
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _searchController = TextEditingController();
  List<CampingItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = campingList
        .where((item) => item.nama
            .toLowerCase()
            .contains(widget.categoryFilter.toLowerCase()))
        .toList();

    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredItems = campingList
            .where((item) => item.nama
                .toLowerCase()
                .contains(widget.categoryFilter.toLowerCase()))
            .toList();
      } else {
        _filteredItems = campingList
            .where((item) =>
                item.nama
                    .toLowerCase()
                    .contains(widget.categoryFilter.toLowerCase()) &&
                (item.nama.toLowerCase().contains(query) ||
                    item.brand.toLowerCase().contains(query)))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final crossAxisCount = isDesktop ? 4 : 2;
    final childAspectRatio = isDesktop ? 0.8 : 0.75;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 550.0,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF172554),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.categoryBackground,
                    fit: BoxFit.cover,
                  ),
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
                    )),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: 0.50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Home > ${widget.categoryName}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  widget.categoryName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText:
                                        "Search in ${widget.categoryName}...",
                                    prefixIcon: const Icon(Icons.search,
                                        color: Colors.grey),
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 14),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)),
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

          // === GRID PRODUK (TERFILTER REALTIME) ===
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ProductCard(item: _filteredItems[index]);
              },
            ),
          ),

          // === Pesan jika hasil kosong ===
          if (_filteredItems.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    children: const [
                      Icon(Icons.search_off, size: 60, color: Colors.grey),
                      SizedBox(height: 10),
                      Text("Produk tidak ditemukan",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// === KARTU PRODUK (SUDAH ADA HARGA DISKON) ===
class ProductCard extends StatelessWidget {
  final CampingItem item;
  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double? hargaDiskon;
    try {
      var dynamicItem = item as dynamic;
      if (dynamicItem.hargaDiskon != null) {
        hargaDiskon = dynamicItem.hargaDiskon;
      }
    } catch (e) {
      hargaDiskon = null;
    }

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
          ],
        ),
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
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(item.nama,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  if (hargaDiskon != null) ...[
                    Text(
                      formatRupiah.format(item.harga),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatRupiah.format(hargaDiskon),
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else ...[
                    Text(
                      formatRupiah.format(item.harga),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
