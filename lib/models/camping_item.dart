class CampingItem {
  String _nama;
  String _brand;
  String _gambar;
  String _deskripsi;

  CampingItem({
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
  })  : _nama = nama,
        _brand = brand,
        _gambar = gambar,
        _deskripsi = deskripsi;

 
  String get nama => _nama;
  String get brand => _brand;
  String get gambar => _gambar;
  String get deskripsi => _deskripsi;

 
  set nama(String value) => _nama = value;
  set brand(String value) => _brand = value;
  set gambar(String value) => _gambar = value;
  set deskripsi(String value) => _deskripsi = value;

  
  String getInfo() {
    return "$_nama dari brand $_brand";
  }
}
