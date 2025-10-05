import 'package:flutter/material.dart';
abstract class CampingItem {
  // Properti privat (sesuai kodemu)
  String _nama;
  String _brand;
  String _gambar;
  String _deskripsi;
  double _harga;
  String _gambarLatar; // <-- TAMBAHKAN INI

  // Constructor
  CampingItem({
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required double harga,
    required String gambarLatar, // <-- TAMBAHKAN INI
  })  : _nama = nama,
        _brand = brand,
        _gambar = gambar,
        _deskripsi = deskripsi,
        _harga = harga,
        _gambarLatar = gambarLatar; // <-- TAMBAHKAN INI

  // Getter (sesuai kodemu)
  String get nama => _nama;
  String get brand => _brand;
  String get gambar => _gambar;
  String get deskripsi => _deskripsi;
  double get harga => _harga;
  String get gambarLatar => _gambarLatar; // <-- TAMBAHKAN INI

  // Setter (sesuai kodemu)
  set nama(String value) => _nama = value;
  set brand(String value) => _brand = value;
  set gambar(String value) => _gambar = value;
  set deskripsi(String value) => _deskripsi = value;
  set harga(double value) => _harga = value;
  set gambarLatar(String value) => _gambarLatar = value; // <-- TAMBAHKAN INI

  // Method
  String getInfo() {
    return _deskripsi;
  }

  // Fungsi abstract baru yang wajib di-override oleh kelas turunan
  Widget buildSpecificDetails(); 
}