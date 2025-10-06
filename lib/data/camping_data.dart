import 'package:login_app/models/carrier.dart';
import 'package:login_app/models/headlamp.dart';
import 'package:login_app/models/hydropack.dart';
import 'package:login_app/models/jacket.dart';
import 'package:login_app/models/komporportable.dart';
import 'package:login_app/models/sepatu.dart';
import 'package:login_app/models/sleepingbag.dart';
import 'package:login_app/models/tenda.dart';
import 'package:login_app/models/trackingpole.dart';
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
      gambarLatar: "assets/images/backgroundtenda.jpg"),

    Tenda(
      nama: 'Tenda',
      brand: 'Eureka',
      gambar:
          "assets/images/Tenda2.png",
      deskripsi: 'Tenda Eureka, cocok untuk camping bersama teman atau pasangan, dan Tenda yang sangat besar untuk keluarga',
      kapasitas: 6,
      harga: 4500000,
      gambarLatar: "assets/images/backgroundtenda.jpg"),

  Carrier(
      nama: 'Carrier',
      brand: 'Arei',
      gambar:
          "assets/images/carrier60L.png",
      deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      liter: 60,
      harga: 750000,
      gambarlatar: "assets/images/Mountain.png"),

  Carrier(
      nama: 'Carrier',
      brand: 'Eiger',
      gambar:
          "assets/images/carrier.png",
      deskripsi: 'Carrier berkapasitas 60L, nyaman dipakai untuk pendakian panjang',
      liter: 60,
      harga: 750000,
      gambarlatar: "assets/images/Mountain.png"),

  Carrier(
      nama: 'Carrier',
      brand: 'Eiger',
      gambar:
          "assets/images/carrier2.png",
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
      harga: 450000,
      Ukuran: 'Regular',
      gambarLatar: "assets/images/backgroundsleepingbag.png"),


  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu.png",
      deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29',
      harga: 1200000,
      gambarLatar: "assets/images/backgroundsepatu.png"),

  Sepatu(
      nama: 'Sepatu',
      brand: 'Oboz',
      gambar:
          "assets/images/Sepatu2.png",
      deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29,30,31',
      harga: 1300000,
      gambarLatar: "assets/images/backgroundsepatu.png"),

  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar:
          "assets/images/Sepatu3.png",
      deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29,30,31',
      harga: 1100000,
      gambarLatar: "assets/images/backgroundsepatu.png"),

  Sepatu(
      nama: 'Sepatu',
      brand: 'Arei',
      gambar:
          "assets/images/Sepatu5.png",
      deskripsi: 'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29,30,31',
      harga: 1250000,
      gambarLatar: "assets/images/backgroundsepatu.png"),

    Hydropack(
      nama: 'Hydropack',
      brand: 'Urban Peak Hybrid',
      gambar:
          "assets/images/Hydropack.png",
      deskripsi: 'Hydropak ringan berkapasitas 2L, cocok untuk hiking singkat atau membawa perlengkapan tambahan',
      kapasitas: 2,
      harga: 350000,
      gambarlatar: "assets/images/backgroundhydropack.png"),
      
    Headlamp(
      nama: 'Headlamp',
      brand: 'Fenix',
      gambar:
          "assets/images/Headlamp.png",
      deskripsi: 'Headlamp dengan cahaya LED terang hingga 3000 lumen, tahan air, dan dapat mempertahankan output ekstrem jauh lebih lama daripada mode boost konvensional',
      lumen: 3000,
      harga: 400000, 
      gambarlatar: 'assets/images/Mountain.png'),

    Jacket(
      nama: 'Jacket Gunung',
      brand: 'Arcteryx',
      gambar:
          "assets/images/jacket1.png",
      deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 650000, 
      gambarLatar: 'assets/images/backgroundjacket.jpg'),

    Jacket(
      nama: 'Jacket Gunung',
      brand: 'TNF',
      gambar:
          "assets/images/jacket2.png",
      deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 650000, 
      gambarLatar: 'assets/images/backgroundjacket.jpg'),

    Jacket(
      nama: 'Jacket Gunung',
      brand: 'Patagonia',
      gambar:
          "assets/images/jacket3.png",
      deskripsi: 'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 650000, 
      gambarLatar: 'assets/images/backgroundjacket.jpg'),

    KomporPortable(
      nama: 'Kompor Portable',
      brand: 'Crystaline',
      gambar:
          "assets/images/komporportable.png",
      deskripsi: 'Kompor portable berbahan bakar gas kaleng yang praktis untuk memasak saat camping. Ringan dan mudah dibawa',
      bahanBakar: "Gas",
      harga: 300000, 
      gambarLatar: 'assets/images/Mountain.png'),

    Trackingpole(
      nama: 'Tracking Pole',
      brand: 'Halim',
      gambar:
          "assets/images/trackingpole1.png",
      deskripsi: 'Tracking pole ringan dan kuat, membantu menjaga keseimbangan saat mendaki di medan terjal',
      Panjang: '130cm, 140cm, 150cm',
      harga: 1200000,
      gambarLatar: "assets/images/backgroundtrackingpole.png"),

];
