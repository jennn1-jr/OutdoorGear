// file: models/jacket.dart

import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';
import 'package:login_app/models/sepatu.dart'; // Impor ChoiceButton dari file sepatu

class Jacket extends CampingItem {
  final String ukuran;
  // final String deskripsi; // <-- Sebaiknya ini dihapus jika sudah ada di super()

  Jacket({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required this.ukuran,
    required double harga,
    required String gambarlatar,
  }) : super(
    id: id,
    nama: nama,
    brand: brand,
    gambar: gambar,
    harga: harga,
    deskripsi: deskripsi,
    gambarlatar: gambarlatar,
  );

  @override
  String getInfo() => deskripsi;

  // ==============================================================
  // PERBAIKAN LOGIKA UTAMA ADA DI SINI
  // ==============================================================
  @override
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ukuran Tersedia:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: ukuran.split(',').map((size) {
            final currentSize = size.trim();
            final isSelected = selectedSize == currentSize;

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

// Catatan: Kelas ChoiceButton tidak perlu ditulis ulang di sini
// jika sudah ada di file sepatu.dart dan sudah diimpor.