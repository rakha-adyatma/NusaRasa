import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PempekPage extends StatelessWidget {
  // Fungsi untuk membuka URL dengan format terbaru
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'NusaRasa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/sumatera/pempek.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Text(
              'Pempek',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Pempek biasanya disajikan dengan kuah cuka yang disebut "cuko," yang terbuat dari campuran air, cuka, gula merah, dan cabai, memberikan rasa asam, manis, dan pedas yang khas.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Bahan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Terbuat dari ikan (biasanya ikan tenggiri) yang digiling halus dan dicampur dengan tepung sagu, air, dan bumbu-bumbu. Adonan ini kemudian dibentuk menjadi berbagai bentuk, seperti bulat, lonjong, atau pipih, dan direbus atau digoreng hingga matang.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40), // Tambahkan jarak di sini
            // Dua tombol sejajar (Review & Tutorial) dengan jarak di tengah
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Review di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/jPEKL0jON_E?si=GWFeSSjU1_fJia6y');
                  },
                  icon: Icon(Icons.play_circle_fill, color: Colors.white),
                  label: Text(
                    "Review",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),

                // Jarak di antara tombol
                const SizedBox(width: 12),

                // Tombol Tutorial di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/jpBITfn4ce0?si=b2yeZSWWokqjXPY_');
                  },
                  icon: Icon(Icons.play_circle_fill, color: Colors.white),
                  label: Text(
                    "Tutorial",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Menambahkan jarak di bawah tombol
            // Tombol untuk rekomendasi resto di Google Maps
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://maps.app.goo.gl/xUqTz7qMMcdL1SVn9');
                },
                icon: Icon(Icons.map, color: Colors.white),
                label: Text(
                  "Rekomendasi Resto",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
