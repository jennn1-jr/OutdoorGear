// KODE KELAS CARRIER YANG SUDAH DIPERBAIKI
import 'package:flutter/material.dart';
import 'camping_item.dart'; // Pastikan path ini benar

class Carrier extends CampingItem {
  final int liter;
  final String deskripsi;
  final String gambarlatar;

  Carrier({
    required String nama,
    required String brand,
    required String gambar,
    required this.deskripsi, // <-- 2. Terima deskripsi di sini
    required this.liter,
    required double harga,
    required this.gambarlatar,
  }) : super(nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: deskripsi, gambarLatar: gambarlatar); // <-- 3. Kirim deskripsi ke super()

  @override
  String getInfo() {
    // 4. Cukup kembalikan deskripsi
    return deskripsi;
  }

  // 5. Tambahkan fungsi yang wajib ada ini
  @override
  Widget buildSpecificDetails() {
    // Ini adalah widget yang akan ditampilkan di DetailPage
    return _buildInfoRow("Kapasitas", "$liter Liter");
  }

  // Widget bantuan untuk menampilkan info
  Widget _buildInfoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54)),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}