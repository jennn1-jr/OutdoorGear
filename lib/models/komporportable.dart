import 'camping_item.dart';

class KomporPortable extends CampingItem {
  String bahanBakar;

  KomporPortable({
    required String nama,
    required String brand,
    required String gambar,
    required String Deskripsi,
    required this.bahanBakar,
    required double harga,

    
  }) : super(nama: nama, brand: brand, gambar: gambar, harga: harga,deskripsi: Deskripsi);

  @override
  String getInfo() {
    return "$nama $brand $harga - Bahan bakar: $bahanBakar ($deskripsi)";
  }
}
