// file: models/sepatu.dart

import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class Sepatu extends CampingItem {
  final String ukuran; 
  // deskripsi sudah ada di induk, jadi tidak perlu didefinisikan ulang
  // final String deskripsi; // <-- Sebaiknya ini dihapus jika sudah ada di super()

  Sepatu({
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
        Wrap( // Gunakan Wrap agar tombol bisa turun baris jika tidak muat
          spacing: 8.0,
          runSpacing: 8.0,
          children: ukuran.split(',').map((size) {
            final currentSize = size.trim();
            // Cek apakah ukuran tombol ini adalah ukuran yang sedang dipilih
            final isSelected = selectedSize == currentSize;

            return ChoiceButton(
              label: currentSize,
              isSelected: isSelected, // Kirim status terpilih
              onTap: () => onSizeSelected(currentSize), // Kirim fungsi untuk memilih
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ==============================================================
// WIDGET CHOICEBUTTON DIPERBARUI TOTAL
// ==============================================================
class ChoiceButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceButton({
    super.key, 
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan warna berdasarkan status 'isSelected'
    final color = isSelected ? Colors.deepOrange : Colors.grey.shade300;
    final textColor = isSelected ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: onTap, // Panggil fungsi saat tombol di-tap
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Text(
          label, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor
          )
        ),
      ),
    );
  }
}