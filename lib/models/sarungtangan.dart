import 'package:flutter/material.dart';
import 'package:login_app/models/camping_item.dart';

class Sarungtangan extends CampingItem {
  final String ukuran; 
  final String deskripsi;

  Sarungtangan({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String gambarLatar,
    required this.deskripsi,
    required this.ukuran,
    required double harga,
  }) : super(id: id, nama: nama, brand: brand, gambar: gambar, gambarLatar: gambarLatar, harga: harga, deskripsi: deskripsi);

  @override
  String getInfo() => deskripsi;

  @override
  Widget buildSpecificDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ukuran Tersedia:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54)),
        const SizedBox(height: 8),
        
        Row(
          children: ukuran.split(',').map((size) => ChoiceButton(label: size.trim())).toList(),
        ),
      ],
    );
  }
}
class ChoiceButton extends StatelessWidget {
  final String label;
  const ChoiceButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}