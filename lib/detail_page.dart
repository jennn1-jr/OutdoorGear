import 'package:flutter/material.dart';
import 'models/camping_item.dart';

class DetailPage extends StatefulWidget {
  final CampingItem item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF172554),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              // ===========================================
              // BAGIAN YANG DIPERBARUI ADA DI SINI
              // ===========================================
              background: Image.asset(
                widget.item.gambarLatar, // <-- SEKARANG DINAMIS
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
              // ===========================================
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(widget.item.gambar,
                                fit: BoxFit.contain, height: 250),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 3,
                          child: ProductDetails(
                            item: widget.item,
                            quantity: _quantity,
                            onIncrement: _incrementQuantity,
                            onDecrement: _decrementQuantity,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text("Description :",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(
                      widget.item.getInfo(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.black54, height: 1.5),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text("Beli Sekarang",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// === WIDGET DETAIL PRODUK (TIDAK BERUBAH) ===
class ProductDetails extends StatelessWidget {
  final CampingItem item;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductDetails({
    super.key,
    required this.item,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Home > ${item.nama}",
            style: TextStyle(color: Colors.grey.shade600)),
        const SizedBox(height: 8),
        Text(item.nama,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(item.brand,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
        const SizedBox(height: 16),
        Text("Rp. ${item.harga.toString()}",
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const SizedBox(height: 20),
        item.buildSpecificDetails(),
        const SizedBox(height: 20),
        const Text("Jumlah :",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        QuantitySelector(
          quantity: quantity,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}

// Widget QuantitySelector tidak berubah
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(icon: const Icon(Icons.remove), onPressed: onDecrement),
        Text(quantity.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(icon: const Icon(Icons.add), onPressed: onIncrement),
      ]),
    );
  }
}