import 'package:login_app/models/carrier.dart';
import 'package:login_app/models/headlamp.dart';
import 'package:login_app/models/hydropack.dart';
import 'package:login_app/models/jacket.dart';
import 'package:login_app/models/komporportable.dart';
import 'package:login_app/models/sepatu.dart';
import 'package:login_app/models/sleepingbag.dart';
import 'package:login_app/models/tenda.dart';
import '/models/camping_item.dart';

final List<CampingItem> campingList = [
  Tenda(
      nama: 'TendaDome',
      brand: 'Eiger',
      gambar:
          "assets/images/Tenda.png",
      Deskripsi: 'Tenda dome untuk 4 orang, cocok untuk camping keluarga',
      kapasitas: 4),
  Carrier(
      nama: 'Carrier',
      brand: 'Arei',
      gambar:
          "assets/images/carrier60L.png",
      Deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      liter: 60),
  Sleepingbag(
    nama: 'Sleeping Bag',
      brand: 'Helium',
      gambar:
          "assets/images/sleepingbag.png",
      Deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      kapasitas: 60),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      Deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      Ukuran: 29),
    Hydropack(
      nama: 'Hydropack',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      Deskripsi: 'Hydropak ringan berkapasitas 25L, cocok untuk hiking singkat atau membawa perlengkapan tambahan',
      kapasitas: 30),
    Headlamp(
      nama: 'Headlamp',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      Deskripsi: 'Headlamp dengan cahaya LED terang hingga 300 lumen, tahan air, dan memiliki mode lampu hemat daya untuk perjalanan malam',
      lumen: 29),
    JaketGunung(
      nama: 'Jaket Gunung',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      Deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL"),
    KomporPortable(
      nama: 'Kompor Portable',
      brand: 'Salewa',
      gambar:
          "assets/images/komporportable.png",
      Deskripsi: 'Kompor portable berbahan bakar gas kaleng yang praktis untuk memasak saat camping. Ringan dan mudah dibawa',
      bahanBakar: "Gas" ),
];
