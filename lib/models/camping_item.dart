class CampingItem {
  String _nama;
  String _brand;
  String _gambar;
  String _deskripsi;
  double _harga; // ← tambahin harga

  CampingItem({
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required double harga, // ← tambahin parameter harga
  })  : _nama = nama,
        _brand = brand,
        _gambar = gambar,
        _deskripsi = deskripsi,
        _harga = harga;

  // Getter
  String get nama => _nama;
  String get brand => _brand;
  String get gambar => _gambar;
  String get deskripsi => _deskripsi;
  double get harga => _harga; // ← getter harga

  // Setter
  set nama(String value) => _nama = value;
  set brand(String value) => _brand = value;
  set gambar(String value) => _gambar = value;
  set deskripsi(String value) => _deskripsi = value;
  set harga(double value) => _harga = value; // ← setter harga

  // Method
  String getInfo() {
    return "$_nama dari brand $_brand, harga: Rp$_harga";
  }
}
