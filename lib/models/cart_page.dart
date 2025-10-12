import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_app/models/cart_providers.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: const Color.fromARGB(255, 147, 151, 167),
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
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: ListTile(
                          leading: Image.asset(
                            cartItem.item.gambar,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(cartItem.item.nama),
                          subtitle: Text(
                            "${formatRupiah.format(cartItem.item.harga)} x ${cartItem.quantity}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => cart.kurangiItem(cartItem.item),
                              ),
                              Text("${cartItem.quantity}"),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => cart.tambahItem(cartItem.item),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Total: ${formatRupiah.format(cart.totalHarga)}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(totalHarga: cart.totalHarga),
                            ),
                          );
                        },
                        icon: const Icon(Icons.payment),
                        label: const Text("Lanjut ke Pembayaran"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
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

/// =========================
/// 🔹 Halaman Pembayaran
/// =========================
class PaymentPage extends StatelessWidget {
  final double totalHarga;
  const PaymentPage({super.key, required this.totalHarga});

  @override
  Widget build(BuildContext context) {
    final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Scan QR untuk Melanjutkan Pembayaran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: QrImageView(
                data: "https://pembayaran.outdoorgear.com/pay?id=TXN${DateTime.now().millisecondsSinceEpoch}",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Total yang harus dibayar:",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            Text(
              formatRupiah.format(totalHarga),
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.receipt_long),
              label: const Text("Cetak Struk / Kwitansi"),
              onPressed: () async {
                final pdf = pw.Document();
                final now = DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now());

                pdf.addPage(
                  pw.Page(
                    pageFormat: PdfPageFormat.a4,
                    build: (pw.Context context) {
                      return pw.Padding(
                        padding: const pw.EdgeInsets.all(24),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text("OutdoorGear - Struk Pembelian",
                                style: pw.TextStyle(
                                    fontSize: 20, fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 10),
                            pw.Text("Tanggal: $now"),
                            pw.Divider(),
                            pw.SizedBox(height: 10),
                            pw.Table.fromTextArray(
                              headers: ["Produk", "Qty", "Harga"],
                              data: cart.items
                                  .map((e) => [
                                        e.item.nama,
                                        e.quantity.toString(),
                                        formatRupiah.format(e.item.harga),
                                      ])
                                  .toList(),
                            ),
                            pw.Divider(),
                            pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text(
                                "Total: ${formatRupiah.format(totalHarga)}",
                                style: pw.TextStyle(
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.red,
                                ),
                              ),
                            ),
                            pw.SizedBox(height: 30),
                            pw.Center(
                              child: pw.Text(
                                "Terima kasih telah berbelanja di OutdoorGear!",
                                style: const pw.TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );

                await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async => pdf.save(),
                );

                // kosongkan cart setelah cetak
                cart.kosongkanCart();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali ke Beranda"),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
