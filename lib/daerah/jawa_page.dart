import 'package:dapoer_nusantara/daerah/jawa/jawa_liwet.dart'; // Import halaman Nasi Liwet
import 'package:dapoer_nusantara/daerah/jawa/jawa_gudeg.dart'; // Import halaman Gudeg
import 'package:dapoer_nusantara/daerah/jawa/jawa_pecel.dart'; // Import halaman Pecel
import 'package:dapoer_nusantara/daerah/jawa/jawa_rawon.dart'; // Import halaman Rawon
import 'package:dapoer_nusantara/daerah/jawa/jawa_soto_kudus.dart'; // Import halaman Soto Kudus
import 'package:dapoer_nusantara/daerah/jawa/jawa_tahu_tek.dart'; // Import halaman Tahu Tek
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dapoer_nusantara/daerah/dummy_data.dart'; // Data masakan khas Jawa
import 'package:dapoer_nusantara/favorite_manager.dart';

class JawaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masakan Khas Jawa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFEE2737),
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 0,
      ),
      body: Consumer<FavoriteManager>(
        builder: (context, favoriteManager, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: makananKhasJawa.length,
            itemBuilder: (context, index) {
              final makanan = makananKhasJawa[index];
              bool isFavorite = favoriteManager.isFavorite(makanan);

              return GestureDetector(
                onTap: () {
                  if (makanan['name'] == 'Nasi Liwet Solo') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiwetPage(),
                      ),
                    );
                  } else if (makanan['name'] == 'Pecel') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PecelPage(),
                      ),
                    );
                  } else if (makanan['name'] == 'Rawon') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RawonPage(),
                      ),
                    );
                  } else if (makanan['name'] == 'Soto Kudus') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SotoKudusPage(),
                      ),
                    );
                  } else if (makanan['name'] == 'Tahu Tek') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TahuTekPage(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GudegPage(),
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
          );
        },
      ),
    );
  }
}
