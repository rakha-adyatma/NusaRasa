import 'package:dapoer_nusantara/daerah/dummy_data.dart';
import 'package:dapoer_nusantara/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/coto_makasar.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/ikan_woku_belanga.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/kaledo.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/kapurung.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/sup_konro.dart';
import 'package:dapoer_nusantara/daerah/sulawesi/tinutuan.dart';

class SulawesiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masakan Khas Sulawesi',
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
        itemCount: makananKhasSulawesi.length,
        itemBuilder: (context, index) {
          final makanan = makananKhasSulawesi[index];
          final favoriteManager = Provider.of<FavoriteManager>(context);
          bool isFavorite = favoriteManager.isFavorite(makanan);

          return GestureDetector(
            onTap: () {
              if (makanan['name'] == 'Coto Makasar') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CotoMakasarPage(),
                  ),
                );
              } else if (makanan['name'] == 'Ikan Woku Belanga') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IkanWokuBelangaPage(),
                  ),
                );
              } else if (makanan['name'] == 'Kaledo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KaledoPage(),
                  ),
                );
              } else if (makanan['name'] == 'Kapurung') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KapurungPage(),
                  ),
                );
              } else if (makanan['name'] == 'Sup Konro') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SupKonroPage(),
                  ),
                );
              } else if (makanan['name'] == 'Tinutuan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TinutuanPage(),
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
