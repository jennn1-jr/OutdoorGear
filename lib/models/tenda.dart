import 'camping_item.dart';

class Tenda extends CampingItem {
  int kapasitas;

  Tenda({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.kapasitas,
  }) : super(nama: nama, brand: brand, gambar: gambar , deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand ($deskripsi.) $kapasitas ";
  }
}
