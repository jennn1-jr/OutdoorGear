// file: lib/widgets/info_widgets.dart

import 'package:flutter/material.dart';

// WIDGET BANTUAN UNTUK INFO PRODUK (TANPA UKURAN)
// Namanya 'buildInfoRow' (tanpa '_') agar bisa diakses dari file lain.
Widget buildInfoRow(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54)),
      const SizedBox(height: 8),
      Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ],
  );
}

// WIDGET BANTUAN UNTUK TOMBOL PILIHAN UKURAN
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
    final color = isSelected ? Colors.deepOrange : Colors.grey.shade300;
    final textColor = isSelected ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: onTap,
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