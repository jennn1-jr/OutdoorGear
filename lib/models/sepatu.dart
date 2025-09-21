import 'camping_item.dart';

class Sepatu extends CampingItem {
  int Ukuran;

  Sepatu({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.Ukuran,
  }) : super(nama: nama, brand: brand, gambar: gambar , deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand ($deskripsi.) $Ukuran ";
  }
}
