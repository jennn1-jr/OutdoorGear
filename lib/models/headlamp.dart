import 'camping_item.dart';

class Headlamp extends CampingItem {
  int lumen;

  Headlamp({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.lumen,
    required double harga,

  }) : super(nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: Deskripsi );

  @override
  String getInfo() {
    return "$nama $brand - harga $harga $lumen lumen ($deskripsi)";
  }
}
