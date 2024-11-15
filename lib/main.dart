import 'package:dapoer_nusantara/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_manager.dart';
import 'package:dapoer_nusantara/home.dart';
import 'package:dapoer_nusantara/favorite.dart';
import 'package:dapoer_nusantara/form.dart';
import 'package:dapoer_nusantara/daerah/jawa_page.dart';
import 'package:dapoer_nusantara/daerah/sumatera_page.dart';
import 'package:dapoer_nusantara/daerah/kalimantan_page.dart';
import 'package:dapoer_nusantara/daerah/sulawesi_page.dart';
import 'package:dapoer_nusantara/daerah/papua_page.dart';
import 'package:dapoer_nusantara/signin.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Tambahkan ini
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dapoer Nusantara',
      home: SignInPage(),
      routes: {
        '/jawa': (context) => JawaPage(),
        '/sumatera': (context) => SumateraPage(),
        '/kalimantan': (context) => KalimantanPage(),
        '/sulawesi': (context) => SulawesiPage(),
        '/papua': (context) => PapuaPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [Home(), Favorite(), FormPage()];
  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NusaRasa',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color(0xFFEE2737),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Form',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onTap,
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
