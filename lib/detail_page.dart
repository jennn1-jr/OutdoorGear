import 'package:flutter/material.dart';
import 'models/camping_item.dart';

class DetailPage extends StatelessWidget {
  final CampingItem item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Mengecek lebar layar untuk menentukan layout
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          // Membatasi lebar maksimum di layar besar
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            // Jika layar lebar, gunakan Row. Jika sempit, gunakan SingleChildScrollView dengan Column
            child: isWideScreen
                ? _buildWideLayout()
                : _buildNarrowLayout(),
          ),
        ),
      ),
    );
  }

  // --- WIDGET UNTUK TAMPILAN LEBAR (DESKTOP/TABLET) ---
  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // KOLOM KIRI: GAMBAR PRODUK
        Expanded(
          flex: 1, // Mengambil setengah bagian layar
          child: ProductImage(gambar: item.gambar),
        ),
        const SizedBox(width: 24),
        // KOLOM KANAN: DETAIL PRODUK
        Expanded(
          flex: 1, // Mengambil setengah bagian layar
          child: ProductDetails(item: item),
        ),
      ],
    );
  }

  // --- WIDGET UNTUK TAMPILAN SEMPIT (MOBILE) ---
  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // GAMBAR PRODUK DI ATAS
          ProductImage(gambar: item.gambar),
          const SizedBox(height: 24),
          // DETAIL PRODUK DI BAWAH
          ProductDetails(item: item),
        ],
      ),
    );
  }
}


// === WIDGET TERPISAH UNTUK BAGIAN GAMBAR PRODUK ===
class ProductImage extends StatelessWidget {
  final String gambar;
  const ProductImage({super.key, required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          gambar,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// === WIDGET TERPISAH UNTUK BAGIAN DETAIL PRODUK ===
class ProductDetails extends StatelessWidget {
  final CampingItem item;
  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // BRAND
        Text(
          item.brand.toUpperCase(),
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        // NAMA PRODUK
        Text(
          item.nama,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        
        // DESKRIPSI
        const Text(
          "Deskripsi",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          item.getInfo(), // Mengambil deskripsi dari model
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),

        // TOMBOL BELI
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Fitur Beli segera hadir!")),
              );
            },
            icon: const Icon(Icons.shopping_cart_checkout),
            label: const Text("Beli Sekarang"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF172554),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}