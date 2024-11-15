import 'package:dapoer_nusantara/daerah/dummy_data.dart';
import 'package:dapoer_nusantara/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/ayam_cincane.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/bubur_pedas_sambas.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/ikan_patin_bakar.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/juhu_singkah.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/ketupat_kandangan.dart';
import 'package:dapoer_nusantara/daerah/kalimantan/soto_banjar.dart';

class KalimantanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masakan Khas Kalimantan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFEE2737),
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8,
        ),
        itemCount: makananKhasKalimantan.length,
        itemBuilder: (context, index) {
          final makanan = makananKhasKalimantan[index];
          final favoriteManager = Provider.of<FavoriteManager>(context);
          bool isFavorite = favoriteManager.isFavorite(makanan);

          return GestureDetector(
            onTap: () {
              if (makanan['name'] == 'Ayam Cincane') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AyamCincanePage(),
                  ),
                );
              } else if (makanan['name'] == 'Bubur Pedas Sambas') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuburPedasSambasPage(),
                  ),
                );
              } else if (makanan['name'] == 'Ikan Patin Bakar') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IkanPatinBakarPage(),
                  ),
                );
              } else if (makanan['name'] == 'Juhu Singkah') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JuhuSingkahPage(),
                  ),
                );
              } else if (makanan['name'] == 'Ketupat Kandangan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KetupatKandanganPage(),
                  ),
                );
              } else if (makanan['name'] == 'Soto Banjar') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SotoBanjarPage(),
                  ),
                );
              }
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0)),
                      child: Image.asset(
                        makanan['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      makanan['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      favoriteManager.toggleFavorite(makanan);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
