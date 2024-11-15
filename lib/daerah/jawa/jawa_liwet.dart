import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LiwetPage extends StatelessWidget {
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
                        'assets/images/jawa/nasi_liwet.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Text(
              'Nasi Liwet Solo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Nasi liwet Solo adalah salah satu hidangan khas dari kota Solo, Jawa Tengah, Indonesia. Hidangan ini terkenal karena cara memasaknya yang unik dan cita rasanya yang khas. Nasi liwet biasanya dimasak dengan menggunakan santan, daun pandan, dan rempah-rempah.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Bahan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Beras, santan, daun pandan, daun salam, serai, bawang merah, bawang putih, garam, ayam, telur, tahu, tempe, sambal.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 60), // Tambahkan jarak di sini
            // Dua tombol sejajar (Review & Tutorial) dengan jarak di tengah
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Review Liwet di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/H5gCL7BcNto?si=TwOzfNPmErQpag_E');
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

                // Tombol Tutorial Liwet di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/W1Y2S6Nzg8Q?si=n3uoB6s-ST3OtunF');
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
            // Tombol untuk rekomendasi resto Liwet di Google Maps
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://maps.app.goo.gl/MddZLr8aogZ58Bet8');
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
