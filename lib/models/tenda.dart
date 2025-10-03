import 'camping_item.dart';

class Tenda extends CampingItem {
  int kapasitas;

  Tenda({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.kapasitas,
    required double harga,

  }) : super(nama: nama, brand: brand, gambar: gambar ,harga: harga, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga ($deskripsi.) Kapasitas: $kapasitas ";
  }
}
