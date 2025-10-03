import 'camping_item.dart';

class Sepatu extends CampingItem {
  int Ukuran;

  Sepatu({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.Ukuran,
    required double harga,

  }) : super(nama: nama, brand: brand, gambar: gambar , harga: harga, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga ($deskripsi.) UKURAN : $Ukuran ";
  }
}
