import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PecelPage extends StatelessWidget {
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
                        'assets/images/jawa/pecel.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Text(
              'Pecel',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Pecel adalah hidangan tradisional Indonesia dari Jawa yang terdiri dari sayuran rebus, seperti kangkung dan tauge, disajikan dengan sambal pecel.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Bahan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Pecel adalah hidangan sayuran rebus seperti kangkung dan tauge, disajikan dengan sambal kacang dan biasanya dilengkapi nasi, tahu, tempe, dan kerupuk.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50), // Tambahkan jarak di sini
            // Dua tombol sejajar (Review & Tutorial) dengan jarak di tengah
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Review Pecel di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/Yd6Wvb2MJZE?si=8grGGqjEIK6AYZE8');
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

                // Tombol Tutorial Pecel di YouTube
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL(
                        'https://youtu.be/ejWTgeSUUiQ?si=-i5HlcAfjJdrpF9j');
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
            // Tombol untuk rekomendasi resto Pecel di Google Maps
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://maps.app.goo.gl/18nkCJkDg8Eb1TKh6');
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
