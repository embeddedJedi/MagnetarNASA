import 'package:flutter/material.dart';
import 'package:magnetar_fima/pages/homepage.dart';
import 'package:magnetar_fima/pages/resources.dart';
import 'package:magnetar_fima/pages/webview/mapweb.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Index of the selected bottom navigation bar item

  // Define the pages corresponding to each bottom navigation bar item
  final List<Widget> _pages = [
    HomePage(),
    MapWeb(),
    ForestFireApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(50.0), // İstediğiniz yüksekliği ayarlayabilirsiniz.
        child: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Magnetar FIMA'),
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child:
                    Image.asset('assets/logo/logo.jpg', width: 45, height: 45),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
      ),
      body:
          Container(child: _pages[_selectedIndex]), // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle item selection
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ana Sayfa İçeriği'),
    );
  }
}

class AraSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Arama Sayfası İçeriği'),
    );
  }
}

class AyarlarSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ayarlar Sayfası İçeriği'),
    );
  }
}
