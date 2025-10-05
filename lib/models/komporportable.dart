import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class KomporPortable extends CampingItem {
  final String bahanBakar;
  final String deskripsi;

  KomporPortable({
    required String nama,
    required String brand,
    required String gambar,
    required String gambarLatar,
    required this.deskripsi,
    required this.bahanBakar,
    required double harga,
  }) : super(
            nama: nama,
            brand: brand,
            gambar: gambar,
            gambarLatar: gambarLatar,
            harga: harga,
            deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return _buildInfoRow("Bahan Bakar", bahanBakar);
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
