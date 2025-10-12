import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class Sleepingbag extends CampingItem {
  final String Ukuran;
  final String deskripsi;

  Sleepingbag({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String gambarLatar,
    required this.deskripsi,
    required this.Ukuran,
    required double harga,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, gambarLatar: gambarLatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return _buildInfoRow("Ukuran", Ukuran);
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