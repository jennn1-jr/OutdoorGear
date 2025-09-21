import 'package:login_app/models/carrier.dart';
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
  
];
