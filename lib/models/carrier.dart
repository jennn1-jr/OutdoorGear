// KODE KELAS CARRIER YANG SUDAH DIPERBAIKI
import 'package:flutter/material.dart';
import 'camping_item.dart'; // Pastikan path ini benar

class Carrier extends CampingItem {
  final int liter;
  // deskripsi & gambarLatar sudah ada di induk, tidak perlu didefinisikan ulang
  // final String deskripsi;
  // final String gambarlatar; 

  Carrier({
    required String id, 
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required this.liter,
    required double harga,
    required String gambarlatar, // <-- Gunakan camelCase agar konsisten
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: deskripsi, gambarlatar: gambarlatar);

  @override
  String getInfo() {
    return deskripsi;
  }

  // =========================================================
  // PERUBAHAN UTAMA HANYA DI BARIS INI
  // =========================================================
  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    // Parameter 'selectedSize' dan 'onSizeSelected' diterima tapi diabaikan
    // karena Carrier tidak memiliki pilihan ukuran.
    return _buildInfoRow("Kapasitas", "$liter Liter");
  }
  // =========================================================

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