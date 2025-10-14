import 'package:flutter/material.dart';
import 'package:login_app/info_widget.dart';
import 'camping_item.dart';


class Headlamp extends CampingItem {
  final int lumen;

  Headlamp({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required double harga,
    required this.lumen,
    required String gambarlatar,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: deskripsi, gambarlatar: gambarlatar);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    // 2. Panggil 'buildInfoRow' dari file bantuan (tanpa '_')
    return buildInfoRow("Lumen", "$lumen lm");
  }

  // 3. HAPUS definisi _buildInfoRow dari sini
}