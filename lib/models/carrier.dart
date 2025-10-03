import 'camping_item.dart';

class Carrier extends CampingItem {
  int liter;

  Carrier({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.liter,
    required double harga, 


  }) : super(nama: nama, brand: brand, gambar: gambar ,harga: harga, deskripsi: Deskripsi,);

  @override
  String getInfo() {
    return "$nama $brand ($deskripsi.) $liter Liter - Harga: Rp$harga";
  }
}