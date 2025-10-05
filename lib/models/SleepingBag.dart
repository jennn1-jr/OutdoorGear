import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class Sleepingbag extends CampingItem {
  final String suhuIdeal; // Contoh properti unik untuk sleeping bag
  final String deskripsi;

  Sleepingbag({
    required String nama,
    required String brand,
    required String gambar,
    required String gambarLatar,
    required this.deskripsi,
    required this.suhuIdeal,
    required double harga, required int kapasitas,
  }) : super(nama: nama, brand: brand, gambar: gambar, gambarLatar: gambarLatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return _buildInfoRow("Suhu Ideal", suhuIdeal);
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}