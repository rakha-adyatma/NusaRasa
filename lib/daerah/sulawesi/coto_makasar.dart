import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CotoMakasarPage extends StatelessWidget {
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
                        'assets/images/sulawesi/coto_makasar.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Text(
              'Coto Makasar',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Coto Makassar adalah salah satu hidangan khas dari Makassar, Sulawesi Selatan, Indonesia. Hidangan ini merupakan sejenis sup atau soto yang terbuat dari daging sapi.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Bahan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Penggunaan bumbu-bumbu seperti bawang merah, bawang putih, jahe, kunyit, dan rempah-rempah lainnya.',
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
                        'https://youtu.be/-SQo2W3gxE4?si=iq44lrpGL_GS8nGZ');
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
                        'https://youtu.be/hOl6ZlvaTs4?si=7046p6k-y_t11522');
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
                  _launchURL('https://maps.app.goo.gl/HuctmTahj9AFJHHn6');
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
