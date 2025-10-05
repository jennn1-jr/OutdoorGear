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
      deskripsi: 'Tenda Mountainsmith, cocok untuk camping bersama teman atau pasangan, dan pemasangan cepat yang ringan',
      kapasitas: 2,
      harga: 2500000,
      gambarLatar: "assets/images/Mountain.png"),

  Carrier(
      nama: 'Carrier',
      brand: 'Arei',
      gambar:
          "assets/images/carrier60L.png",
      deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      liter: 60,
      harga: 750000,
      gambarlatar: "assets/images/Mountain.png"),
      
  Sleepingbag(
    nama: 'Sleeping Bag',
      brand: 'Helium',
      gambar:
          "assets/images/sleepingbag.png",
      deskripsi: 'Kantung tidur Helium dirancang untuk para pecinta alam, menawarkan isolasi yang ringan dan efisien. Kantung Helium diisi dengan bulu bebek premium, memberikan isolasi dan kehangatan yang sangat baik untuk berbagai aktivitas luar ruangan',
      kapasitas: 800,
      harga: 450000,
      suhuIdeal: '-4°C',
      gambarLatar: "assets/images/Mountain.png"),


  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29',
      harga: 1200000,
      gambarLatar: "assets/images/Mountain.png"),

    Hydropack(
      nama: 'Hydropack',
      brand: 'Urban Peak Hybrid',
      gambar:
          "assets/images/Hydropack.png",
      deskripsi: 'Hydropak ringan berkapasitas 2L, cocok untuk hiking singkat atau membawa perlengkapan tambahan',
      kapasitas: 2,
      harga: 350000,
      gambarlatar: "assets/images/Mountain.png"),
      
    Headlamp(
      nama: 'Headlamp',
      brand: 'Fenix',
      gambar:
          "assets/images/Headlamp.png",
      deskripsi: 'Headlamp dengan cahaya LED terang hingga 3000 lumen, tahan air, dan dapat mempertahankan output ekstrem jauh lebih lama daripada mode boost konvensional',
      lumen: 3000,
      harga: 400000, 
      gambarlatar: 'assets/images/Mountain.png'),

    JaketGunung(
      nama: 'Jaket Gunung',
      brand: 'TNF',
      gambar:
          "assets/images/jacketgunung.png",
      deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 650000, 
      gambarLatar: 'assets/images/Mountain.png'),

    KomporPortable(
      nama: 'Kompor Portable',
      brand: 'Crystaline',
      gambar:
          "assets/images/komporportable.png",
      deskripsi: 'Kompor portable berbahan bakar gas kaleng yang praktis untuk memasak saat camping. Ringan dan mudah dibawa',
      bahanBakar: "Gas",
      harga: 300000, 
      gambarLatar: 'assets/images/Mountain.png'),
];
