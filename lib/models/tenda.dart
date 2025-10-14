import 'package:flutter/material.dart';
import 'package:login_app/info_widget.dart';
import 'camping_item.dart';

class Tenda extends CampingItem {
  final int kapasitas;

  Tenda({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String gambarlatar,
    required String deskripsi,
    required this.kapasitas,
    required double harga,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, gambarlatar: gambarlatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    // 2. Panggil 'buildInfoRow' dari file bantuan
    return buildInfoRow("Kapasitas", "$kapasitas Orang");
  }

  // 3. HAPUS definisi _buildInfoRow dari sini
}