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
      nama: 'Tenda',
      brand: 'Mountainsmith',
      gambar:
          "assets/images/Tenda.png",
      Deskripsi: 'Tenda Mountainsmith, cocok untuk camping bersama teman atau pasangan, dan pemasangan cepat yang ringan',
      kapasitas: 2),
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
      Deskripsi: 'Kantung tidur Helium dirancang untuk para pecinta alam, menawarkan isolasi yang ringan dan efisien. Kantung Helium diisi dengan bulu bebek premium, memberikan isolasi dan kehangatan yang sangat baik untuk berbagai aktivitas luar ruangan',
      kapasitas: 800),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      Deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      Ukuran: 29),
    Hydropack(
      nama: 'Hydropack',
      brand: 'Urban Peak Hybrid',
      gambar:
          "assets/images/Hydropack.png",
      Deskripsi: 'Hydropak ringan berkapasitas 2L, cocok untuk hiking singkat atau membawa perlengkapan tambahan',
      kapasitas: 2),
    Headlamp(
      nama: 'Headlamp',
      brand: 'Fenix',
      gambar:
          "assets/images/Headlamp.png",
      Deskripsi: 'Headlamp dengan cahaya LED terang hingga 3000 lumen, tahan air, dan dapat mempertahankan output ekstrem jauh lebih lama daripada mode boost konvensional',
      lumen: 3000),
    JaketGunung(
      nama: 'Jaket Gunung',
      brand: 'TNF',
      gambar:
          "assets/images/jacketgunung.png",
      Deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL"),
    KomporPortable(
      nama: 'Kompor Portable',
      brand: 'Crystaline',
      gambar:
          "assets/images/komporportable.png",
      Deskripsi: 'Kompor portable berbahan bakar gas kaleng yang praktis untuk memasak saat camping. Ringan dan mudah dibawa',
      bahanBakar: "Gas" ),
];
