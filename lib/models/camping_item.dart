
import 'package:flutter/material.dart';

abstract class CampingItem {
  // --- Properti, Constructor, Getter, Setter (TIDAK BERUBAH) ---
  String _id; 
  String _nama;
  String _brand;
  String _gambar;
  String _deskripsi;
  double _harga;
  String _gambarlatar;

  CampingItem({
    required String id,
    required String nama,
    required String brand,
    required String gambar,
    required String deskripsi,
    required double harga,
    required String gambarlatar,
  })  : _id = id,
        _nama = nama,
        _brand = brand,
        _gambar = gambar,
        _deskripsi = deskripsi,
        _harga = harga,
        _gambarlatar = gambarlatar;

  String get id => _id;
  String get nama => _nama;
  String get brand => _brand;
  String get gambar => _gambar;
  String get deskripsi => _deskripsi;
  double get harga => _harga;
  String get gambarlatar => _gambarlatar;
  
  set id(String value) => _id = value;
  set nama(String value) => _nama = value;
  set brand(String value) => _brand = value;
  set gambar(String value) => _gambar = value;
  set deskripsi(String value) => _deskripsi = value;
  set harga(double value) => _harga = value;
  set gambarlatar(String value) => _gambarlatar = value;

  String getInfo() {
    return _deskripsi;
  }

  // ==============================================================
  // PERUBAHAN UTAMA DI SINI: Tambahkan parameter
  // ==============================================================
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected); 
}