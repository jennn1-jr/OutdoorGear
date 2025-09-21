import 'camping_item.dart';

class JaketGunung extends CampingItem {
  String ukuran;

  JaketGunung({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.ukuran,
  }) : super(nama: nama, brand: brand, gambar: gambar, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand - Bahan: $ukuran ($deskripsi)";
  }
}
