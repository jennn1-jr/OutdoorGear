// KODE BARU YANG SUDAH DIPERBAIKI
import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class Headlamp extends CampingItem {
  final int lumen;
  final String deskripsi; // <-- Simpan deskripsi di sini

  Headlamp({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required this.deskripsi, // <-- Terima deskripsi di sini
    required double harga,
    required this.lumen,
    required String gambarlatar,
  }) : super(
            id: id,
            nama: nama,
            brand: brand,
            gambar: gambar,
            harga: harga,
            deskripsi: deskripsi,
            gambarLatar:
                gambarlatar); // <-- Kirim deskripsi dan gambarLatar ke induk

  @override
  String getInfo() {
    // Gunakan deskripsi yang sudah disimpan di kelas ini
    return deskripsi;
  }

  // Tambahkan fungsi yang wajib ada ini
  @override
  Widget buildSpecificDetails() {
    // Ini adalah widget yang akan ditampilkan di DetailPage
    return _buildInfoRow("Lumen", "$lumen lm");
  }

  // Definisikan metode _buildInfoRow di sini
  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
