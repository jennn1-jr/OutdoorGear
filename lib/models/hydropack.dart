import 'package:flutter/material.dart';
import 'package:login_app/info_widget.dart';
import 'camping_item.dart';
class Hydropack extends CampingItem {
  final int kapasitas;

  Hydropack({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required this.kapasitas,
    required double harga,
    required String gambarlatar,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: deskripsi, gambarlatar: gambarlatar);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    // 2. Panggil 'buildInfoRow' dari file bantuan
    return buildInfoRow("Kapasitas", "${kapasitas}L");
  }

  // 3. HAPUS definisi _buildInfoRow dari sini
}