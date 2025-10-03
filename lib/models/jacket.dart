import 'camping_item.dart';

class JaketGunung extends CampingItem {
  String ukuran;

  JaketGunung({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.ukuran,
    required double harga,
  }) : super(nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga - Ukuran: $ukuran ($deskripsi)";
  }
}
