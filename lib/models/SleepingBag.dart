import 'package:flutter/material.dart';
import 'camping_item.dart';
import 'package:login_app/info_widget.dart'; // <-- 1. IMPOR FILE BANTUAN
class Sleepingbag extends CampingItem {
  final String ukuran; // <-- Nama variabel diperbaiki

  Sleepingbag({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String gambarlatar,
    required String deskripsi,
    required this.ukuran,
    required double harga,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, gambarlatar: gambarlatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ukuran Tersedia:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: ukuran.split(',').map((size) {
            final currentSize = size.trim();
            final isSelected = selectedSize == currentSize;
            // 2. Panggil 'ChoiceButton' dari file bantuan
            return ChoiceButton(
              label: currentSize,
              isSelected: isSelected,
              onTap: () => onSizeSelected(currentSize),
            );
          }).toList(),
        ),
      ],
    );
  }
}