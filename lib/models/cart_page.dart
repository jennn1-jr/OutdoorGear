import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_app/models/cart_providers.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: const Color.fromARGB(255, 255, 244, 244),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Keranjang kamu masih kosong 😅",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart.items[index];
                      return Card(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: ListTile(
                          leading: Image.asset(
                            cartItem.item.gambar,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(cartItem.item.nama),
                          subtitle: Text(
                            "Rp ${cartItem.item.harga.toStringAsFixed(0)} x ${cartItem.quantity}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () =>
                                    cart.kurangiItem(cartItem.item),
                              ),
                              Text("${cartItem.quantity}"),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () =>
                                    cart.tambahItem(cartItem.item),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Total: Rp ${cart.totalHarga.toStringAsFixed(0)}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Pembelian Berhasil"),
                              content: const Text(
                                  "Terima kasih telah berbelanja di OutdoorGear!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    cart.kosongkanCart();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Tutup"),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_bag),
                        label: const Text("Checkout Sekarang"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          padding: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
