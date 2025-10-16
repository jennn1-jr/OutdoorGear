import 'package:flutter/material.dart';
import 'dart:convert';

abstract class CampingItem {
  // --- Properti ---
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

  // --- Getter ---
  String get id => _id;
  String get nama => _nama;
  String get brand => _brand;
  String get gambar => _gambar;
  String get deskripsi => _deskripsi;
  double get harga => _harga;
  String get gambarlatar => _gambarlatar;
  
  // --- Setter ---
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
  // 🔹 Tambahan untuk SharedPreferences (Konversi ke/dari Map & JSON)
  // ==============================================================

  /// Konversi objek CampingItem menjadi Map (agar bisa disimpan ke SharedPreferences)
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nama': _nama,
      'brand': _brand,
      'gambar': _gambar,
      'deskripsi': _deskripsi,
      'harga': _harga,
      'gambarlatar': _gambarlatar,
    };
  }

  /// Konversi objek CampingItem menjadi JSON String
  String toJson() => jsonEncode(toMap());

  /// Membuat kembali objek dari JSON String
  /// ⚠ Karena ini kelas abstrak, turunan seperti `TendaItem`, `SepatuItem`, dll
  /// yang akan menggunakan metode ini untuk membuat objek konkret
  static CampingItem fromMap(Map<String, dynamic> map) {
    throw UnimplementedError(
      'Implementasikan fromMap() di subclass sesuai tipe item-nya.'
    );
  }

  static CampingItem fromJson(String source) {
    final data = jsonDecode(source);
    throw UnimplementedError(
      'Implementasikan fromJson() di subclass sesuai tipe item-nya.'
    );
  }

  // ==============================================================
  // 🔹 Masih tetap: digunakan untuk detail item
  // ==============================================================
  Widget buildSpecificDetails(String? selectedSize, Function(String) onSizeSelected);
}
