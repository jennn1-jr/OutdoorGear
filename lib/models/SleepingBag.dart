import 'camping_item.dart';

class Sleepingbag extends CampingItem {
  int kapasitas;

  Sleepingbag({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.kapasitas,
    required double harga,


  }) : super(nama: nama, brand: brand, gambar: gambar ,harga: harga, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga ($deskripsi.) $kapasitas ";
  }
}
