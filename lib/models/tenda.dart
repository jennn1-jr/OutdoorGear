import 'package:flutter/material.dart';
import 'camping_item.dart'; // Sesuaikan path jika file terpisah

class Tenda extends CampingItem {
  final int kapasitas;
  final String deskripsi;

  Tenda({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String gambarLatar,
    required this.deskripsi,
    required this.kapasitas,
    required double harga,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, gambarLatar: gambarLatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return _buildInfoRow("Kapasitas", "$kapasitas Orang");
  }
}


// === WIDGET BANTUAN (Bisa diletakkan di bawah atau di file terpisah) ===

// Widget bantuan untuk menampilkan info simpel (Label & Value)
Widget _buildInfoRow(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54)),
      const SizedBox(height: 8),
      Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ],
  );
}