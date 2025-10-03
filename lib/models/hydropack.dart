import 'camping_item.dart';

class Hydropack extends CampingItem {
  int kapasitas;

  Hydropack({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.kapasitas,
    required double harga,
  }) : super(nama: nama, brand: brand, gambar: gambar, harga: harga, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga - Kapasitas: ${kapasitas}L ($deskripsi)";
  }
}
