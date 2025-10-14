import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart'; // <--- WAJIB untuk PdfPageFormat
import 'models/cart_providers.dart';
import 'package:provider/provider.dart';

final NumberFormat rp = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

class PaymentPage extends StatelessWidget {
  final double amount;
  final String orderId;

  const PaymentPage({super.key, required this.amount, required this.orderId});

  // buat payload QR sederhana — di production: dapatkan payload QR dari gateway (QRIS / provider)
  String _buildPaymentPayload() {
    // contoh payload sederhana (JSON string). Gateways punya format masing2.
    return '{"orderId":"$orderId","amount":${amount.toInt()}}';
  }

  Future<Uint8List> _generatePdfReceipt(BuildContext context, CartProvider cartProvider) async {
    final pdf = pw.Document();
    final now = DateTime.now();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context ctx) {
          return [
            pw.Header(level: 0, child: pw.Text('OutdoorGear', style: pw.TextStyle(fontSize: 24))),
            pw.Text('Kwitansi Pembayaran', style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.Text('Order ID: $orderId'),
            pw.Text('Tanggal: ${DateFormat('yyyy-MM-dd HH:mm').format(now)}'),
            pw.SizedBox(height: 12),
            pw.Table.fromTextArray(
              headers: ['Nama', 'Brand', 'Qty', 'Harga', 'Subtotal'],
              data: cartProvider.items.map((ci) {
                final sub = (ci.item.harga * ci.quantity).toInt();
                return [
                  ci.item.nama,
                  ci.item.brand,
                  ci.quantity.toString(),
                  rp.format(ci.item.harga),
                  rp.format(sub)
                ];
              }).toList(),
            ),
            pw.Divider(),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text('Total: ${rp.format(cartProvider.totalHarga)}', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Terima kasih telah berbelanja di OutdoorGear.'),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    final payload = _buildPaymentPayload();
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: const Color(0xFF172554),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () async {
              // cetak struk langsung
              final pdfData = await _generatePdfReceipt(context, cartProvider);
              await Printing.layoutPdf(onLayout: (_) => pdfData);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ringkasan order
            Card(
              child: ListTile(
                title: const Text('Order Summary'),
                subtitle: Text('Order ID: $orderId\nTotal: ${rp.format(amount)}'),
              ),
            ),
            const SizedBox(height: 16),

            // QR (dari payload)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: payload,
                    version: QrVersions.auto,
                    size: 220,
                  ),
                  const SizedBox(height: 12),
                  const Text('Scan QR untuk melakukan pembayaran'),
                  const SizedBox(height: 8),
                  const Text('(Di environment nyata, payload ini adalah QRIS/URL dari gateway pembayaran)'),
                ],
              ),
            ),

            // Tombol: Cetak struk / Selesai
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final pdfData = await _generatePdfReceipt(context, cartProvider);
                      await Printing.layoutPdf(onLayout: (_) => pdfData);
                    },
                    icon: const Icon(Icons.receipt),
                    label: const Text('Cetak Struk'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // setelah pembayaran sukses => kosongkan cart dan kembali
                      cartProvider.kosongkanCart();
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text('Selesai'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
