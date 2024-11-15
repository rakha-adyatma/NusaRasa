import 'package:dapoer_nusantara/daerah/dummy_data.dart';
import 'package:dapoer_nusantara/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dapoer_nusantara/daerah/sumatera/arsik.dart';
import 'package:dapoer_nusantara/daerah/sumatera/bika_ambon.dart';
import 'package:dapoer_nusantara/daerah/sumatera/gulai_ikan_patin.dart';
import 'package:dapoer_nusantara/daerah/sumatera/mie_aceh.dart';
import 'package:dapoer_nusantara/daerah/sumatera/pempek.dart';
import 'package:dapoer_nusantara/daerah/sumatera/rendang.dart';

class SumateraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masakan Khas Sumatera',
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
        itemCount: makananKhasSumatera.length,
        itemBuilder: (context, index) {
          final makanan = makananKhasSumatera[index];
          final favoriteManager = Provider.of<FavoriteManager>(context);
          bool isFavorite = favoriteManager.isFavorite(makanan);

          return GestureDetector(
            onTap: () {
              if (makanan['name'] == 'Arsik Ikan Mas') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArsikPage(),
                  ),
                );
              } else if (makanan['name'] == 'Bika Ambon') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BikaAmbonPage(),
                  ),
                );
              } else if (makanan['name'] == 'Gulai Ikan Patin') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GulaiIkanPatinPage(),
                  ),
                );
              } else if (makanan['name'] == 'Mie Aceh') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MieAcehPage(),
                  ),
                );
              } else if (makanan['name'] == 'Pempek') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PempekPage(),
                  ),
                );
              } else if (makanan['name'] == 'Rendang') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RendangPage(),
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
