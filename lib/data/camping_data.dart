import 'package:login_app/models/carrier.dart';
import 'package:intl/intl.dart';
import 'package:login_app/models/headlamp.dart';
import 'package:login_app/models/hydropack.dart';
import 'package:login_app/models/jacket.dart';
import 'package:login_app/models/komporportable.dart';
import 'package:login_app/models/sarungtangan.dart';
import 'package:login_app/models/sepatu.dart';
import 'package:login_app/models/sleepingbag.dart';
import 'package:login_app/models/tenda.dart';
import 'package:login_app/models/trackingpole.dart';
import '/models/camping_item.dart';

final NumberFormat formatRupiah =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

final List<CampingItem> campingList = [
  Tenda(
      nama: 'Tenda',
      brand: 'Mountainsmith',
      gambar: "assets/images/Tenda.png",
      deskripsi:
          'Tenda Mountainsmith, cocok untuk camping bersama teman atau pasangan, dan pemasangan cepat yang ringan',
      kapasitas: 2,
      harga: 2500000,
      gambarLatar: "assets/images/backgroundtenda.jpg"),
  Tenda(
      nama: 'Tenda',
      brand: 'Eureka',
      gambar: "assets/images/Tenda2.png",
      deskripsi:
          'Tenda Eureka! kapasitas 6 orang adalah pilihan ideal untuk camping keluarga atau grup kecil yang mengutamakan kenyamanan dan ruang gerak. Didesain dengan fokus pada fungsionalitas, tenda ini menawarkan tempat berlindung yang andal dan mudah digunakan di alam bebas.',
      kapasitas: 6,
      harga: 4500000,
      gambarLatar: "assets/images/backgroundtenda.jpg"),
  Carrier(
      nama: 'Carrier',
      brand: 'Arei',
      gambar: "assets/images/carrier60L.png",
      deskripsi:
          'Carrier Arei 60L adalah pilihan fungsional dan ekonomis untuk pendakian berdurasi 3-5 hari. Tas ini menawarkan kenyamanan yang baik dengan backsystem standar, banyak kantong penyimpanan praktis, dan sudah termasuk raincover. Sangat cocok untuk pendaki pemula hingga menengah yang mencari carrier andal dengan harga terjangkau.',
      liter: 60,
      harga: 750000,
      gambarlatar: "assets/images/Mountain.png"),
  Carrier(
      nama: 'Carrier',
      brand: 'Eiger',
      gambar: "assets/images/carrier.png",
      deskripsi:
          'Carrier Eiger 60L adalah tas gunung premium yang tangguh dan sangat nyaman untuk pendakian panjang atau ekspedisi. Dibuat dengan material berkualitas tinggi, tas ini unggul berkat teknologi backsystem canggih yang memberikan stabilitas dan sirkulasi udara maksimal saat membawa beban berat. Ini adalah pilihan tepat untuk pendaki serius yang memprioritaskan daya tahan dan performa.',
      liter: 60,
      harga: 850000,
      gambarlatar: "assets/images/Mountain.png"),
  Carrier(
      nama: 'Carrier',
      brand: 'Eiger',
      gambar: "assets/images/carrier2.png",
      deskripsi:
          'Carrier Eiger 60L adalah tas gunung premium yang tangguh dan sangat nyaman untuk pendakian panjang atau ekspedisi. Dibuat dengan material berkualitas tinggi, tas ini unggul berkat teknologi backsystem canggih yang memberikan stabilitas dan sirkulasi udara maksimal saat membawa beban berat. Ini adalah pilihan tepat untuk pendaki serius yang memprioritaskan daya tahan dan performa. ',
      liter: 60,
      harga: 850000,
      gambarlatar: "assets/images/Mountain.png"),
  Sleepingbag(
      nama: 'Sleeping Bag',
      brand: 'Helium',
      gambar: "assets/images/sleepingbag.png",
      deskripsi:
          'Kantung tidur Helium dirancang untuk para pecinta alam, menawarkan isolasi yang ringan dan efisien. Kantung Helium diisi dengan bulu bebek premium, memberikan isolasi dan kehangatan yang sangat baik untuk berbagai aktivitas luar ruangan',
      harga: 450000,
      Ukuran: 'Regular',
      gambarLatar: "assets/images/backgroundsleepingbag.png"),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar: "assets/images/Sepatu.png",
      deskripsi:
          'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29',
      harga: 5200000,
      gambarLatar: "assets/images/backgroundsepatu.png"),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Oboz',
      gambar: "assets/images/Sepatu2.png",
      deskripsi:
          'Sepatu Oboz berfokus pada kenyamanan superior dan dukungan anatomi kaki langsung dari kotak. Dengan insole O FIT™ yang terkenal, sepatu ini sangat ideal bagi pendaki yang memprioritaskan kenyamanan di perjalanan jauh dan membutuhkan topangan kaki yang maksimal.',
      ukuran: '29,30,31',
      harga: 4300000,
      gambarLatar: "assets/images/backgroundsepatu.png"),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Salewa',
      gambar: "assets/images/Sepatu3.png",
      deskripsi:
          'sepatu hiking berkualitas tinggi yang dirancang untuk medan alpine yang berat. Sepatu ini menawarkan kombinasi sempurna antara kenyamanan, daya tahan, dan perlindungan, menjadikannya pilihan ideal bagi para pendaki dan petualang yang menuntut performa terbaik dari alas kaki mereka',
      ukuran: '29,30,31',
      harga: 3100000,
      gambarLatar: "assets/images/backgroundsepatu.png"),
  Sepatu(
      nama: 'Sepatu',
      brand: 'Arei',
      gambar: "assets/images/Sepatu5.png",
      deskripsi:
          'Sepatu Arei adalah pilihan fungsional dengan harga sangat terjangkau yang dirancang untuk medan tropis Indonesia. Sepatu ini menyediakan daya tahan dan perlindungan yang cukup untuk pendaki pemula hingga menengah atau mereka yang mencari produk dengan nilai terbaik. ',
      ukuran: '29,30,31',
      harga: 2250000,
      gambarLatar: "assets/images/backgroundsepatu.png"),
  Hydropack(
      nama: 'Hydropack',
      brand: 'Urban Peak Hybrid',
      gambar: "assets/images/Hydropack.png",
      deskripsi:
          'Hydropak ringan berkapasitas 2L, cocok untuk hiking singkat atau membawa perlengkapan tambahan',
      kapasitas: 2,
      harga: 350000,
      gambarlatar: "assets/images/backgroundhydropack.png"),
  Headlamp(
      nama: 'Headlamp',
      brand: 'Fenix',
      gambar: "assets/images/Headlamp.png",
      deskripsi:
          'Headlamp dengan cahaya LED terang hingga 3000 lumen, tahan air, dan dapat mempertahankan output ekstrem jauh lebih lama daripada mode boost konvensional',
      lumen: 3000,
      harga: 400000,
      gambarlatar: 'assets/images/backgroundheadlamp.png'),
  Jacket(
      nama: 'Jacket Gunung',
      brand: 'Arcteryx',
      gambar: "assets/images/jacket1.png",
      deskripsi:
          'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 6500000,
      gambarLatar: 'assets/images/backgroundjacket.jpg'),
  Jacket(
      nama: 'Jacket Gunung',
      brand: 'TNF',
      gambar: "assets/images/jacket2.png",
      deskripsi:
          'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 5500000,
      gambarLatar: 'assets/images/backgroundjacket.jpg'),
  Jacket(
      nama: 'Jacket Gunung',
      brand: 'Patagonia',
      gambar: "assets/images/jacket3.png",
      deskripsi:
          'Jaket gunung tahan angin dan air, dilengkapi lapisan dalam untuk menjaga suhu tubuh tetap hangat saat mendaki di cuaca dingin',
      ukuran: "XL",
      harga: 5999000,
      gambarLatar: 'assets/images/backgroundjacket.jpg'),
  KomporPortable(
      nama: 'Kompor Portable',
      brand: 'Crystaline',
      gambar: "assets/images/komporportable.png",
      deskripsi:
          'Kompor portable berbahan bakar gas kaleng yang praktis untuk memasak saat camping. Ringan dan mudah dibawa',
      bahanBakar: "Gas",
      harga: 100000,
      gambarLatar: 'assets/images/backgroundkomporportable.png'),
  Trackingpole(
      nama: 'Tracking Pole',
      brand: 'Antishock',
      gambar: "assets/images/trackingpole1.png",
      deskripsi:
          'Tracking pole ringan dan kuat, membantu menjaga keseimbangan saat mendaki di medan terjal',
      Panjang: '130cm, 140cm, 150cm',
      harga: 1200000,
      gambarLatar: "assets/images/backgroundtrackingpole.png"),
  Sarungtangan(
      nama: 'Sarung Tangan',
      brand: 'Arei',
      gambar: "assets/images/Sarungtangan.png",
      deskripsi:
          'Sarung tangan yang terbuat dari bahan polar fleece, cocok digunakan ketika dalam cuaca dingin seperti saat camping maupun melakukan kegiatan outdoor lainnya. Sarung tangan Marion siap menemani petualangan Areingers',
      ukuran: 'M,L,XL',
      harga: 130000,
      gambarLatar: "assets/images/backgroundsarungtangan.png"),
];
