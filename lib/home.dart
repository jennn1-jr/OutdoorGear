import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:login_app/categories.dart';
import 'detail_page.dart';
import 'profilpage.dart';
import 'models/cart_providers.dart';
import 'models/camping_item.dart';
import 'data/camping_data.dart';

final NumberFormat formatRupiah =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

class HomePage extends StatefulWidget {
  final String email;
  final String password;
  const HomePage({super.key, required this.email, required this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<CampingItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterSearchResults(_searchController.text);
    });
  }

  void _filterSearchResults(String query) {
    final results = campingList
        .where((item) =>
            item.nama.toLowerCase().contains(query.toLowerCase()) ||
            item.brand.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredItems = results;
    });

    if (query.isEmpty) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _removeOverlay(); // hapus overlay lama

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width * 0.9,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: const BoxConstraints(maxHeight: 250),
              child: filteredItems.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Produk tidak ditemukan"),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        // ✅ Jika kategori Sepatu, kasih diskon 25%
                        double? hargaDiskon;
                        if (item.nama.toLowerCase().contains('sepatu')) {
                          hargaDiskon = item.harga * 0.75;
                        }

                        return ListTile(
                          leading: Image.asset(item.gambar,
                              width: 40, height: 40, fit: BoxFit.cover),
                          title: Text(item.nama),
                          subtitle: hargaDiskon != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      formatRupiah.format(item.harga),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      formatRupiah.format(hargaDiskon),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(formatRupiah.format(item.harga)),
                          onTap: () {
                            _removeOverlay();
                            _searchController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(item: item),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String username =
        widget.email.contains('@') ? widget.email.split('@')[0] : widget.email;
    final cart = Provider.of<CartProvider>(context);

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

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 220).floor().clamp(2, 6);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🔹 Header
          SliverToBoxAdapter(
            child: Container(
              height: screenWidth > 800 ? 500 : 420,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/Mountain.png",
                      fit: BoxFit.cover,
                      color: Colors.black38,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
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

                        // 🔍 Search realtime popup
                        CompositedTransformTarget(
                          link: _layerLink,
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: "Cari produk...",
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),

                  // 🔹 Icon Cart dan Profil
                  Positioned(
                    top: 40,
                    right: 24,
                    child: SafeArea(
                      child: Row(
                        children: [
                          // 🛒 Cart
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.shopping_cart,
                                    color: Colors.white, size: 28),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                              ),
                              if (cart.items.isNotEmpty)
                                Positioned(
                                  right: 4,
                                  top: 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${cart.items.length}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 8),

                          // 👤 Profil
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    email: widget.email,
                                    password: widget.password,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Banner promo
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
                            "Diskon Pembelian Pertama\nAll Sepatu Diskon 25%",
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

          // 🔹 Category section
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
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CategoryCard(
                            gambar: category['gambar']!,
                            name: category['name']!,
                            filter: category['filter']!,
                            gambarLatar: category['gambarLatar']!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Produk lainnya
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Text("All Products",
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
              itemCount: campingList.length,
              itemBuilder: (context, index) {
                return ProductCard(item: campingList[index]);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

// 🔹 Product Card (sudah support diskon sepatu)
class ProductCard extends StatelessWidget {
  final CampingItem item;
  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // ✅ Jika sepatu, diskon 25%
    double? hargaDiskon;
    if (item.nama.toLowerCase().contains('sepatu')) {
      hargaDiskon = item.harga * 0.75;
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
                    if (hargaDiskon != null) ...[
                      Text(
                        formatRupiah.format(item.harga),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Category Card
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
