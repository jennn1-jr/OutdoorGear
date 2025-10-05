import 'package:flutter/material.dart';
import 'camping_item.dart'; // Sesuaikan path jika file terpisah

// ================== HYDROPACK ==================
class Hydropack extends CampingItem {
  final int kapasitas;
  final String deskripsi;
  final String gambarlatar;

  Hydropack({
    required String nama,
    required String brand,
    required String gambar,
    required this.deskripsi,
    required this.kapasitas,
    required double harga,
    required this.gambarlatar,
  }) : super(
    nama: nama,
    brand: brand,
    gambar: gambar,
    harga: harga,
    deskripsi: deskripsi,
    gambarLatar: gambarlatar,
  );

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return _buildInfoRow("Kapasitas", "${kapasitas}L");
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
