import 'camping_item.dart';

class KomporPortable extends CampingItem {
  String bahanBakar;

  KomporPortable({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.bahanBakar,
  }) : super(nama: nama, brand: brand, gambar: gambar, deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand - Bahan bakar: $bahanBakar ($deskripsi)";
  }
}
