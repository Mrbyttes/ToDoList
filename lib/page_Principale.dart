import 'package:flutter/material.dart';
import 'package:qsafe/HomePage.dart';
import 'package:qsafe/scanner_Qr.dart';
import 'package:qsafe/settings.dart';
import 'package:qsafe/Genere_Qr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Num de l'onglet sélectionné

  // Liste des pages des onglets
  final List<Widget> _pages = [
    GenererQrPage(),
    QRCodeScannerPage(), // Page de scan QR code
    settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex =
          index; // Renvoie dans la variable le num de l'onglet sélectionné
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QSafe'),
        backgroundColor: Color.fromARGB(255, 6, 164, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Action pour l'icône de profil
            },
          ),
        ],
        leading: PopupMenuButton<int>(
          icon: Icon(Icons.menu), // Icône du menu
          onSelected: (value) {
            if (value == 1) {
              print("Historique sélectionné");
            } else if (value == 2) {
              print("Galerie sélectionnée");
            } else if (value == 3) {
              print("Aide sélectionnée");
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 1, child: Text("Historique")),
            PopupMenuItem(value: 2, child: Text("Galerie")),
            PopupMenuItem(value: 3, child: Text("Aide")),
          ],
        ),
      ),
      body: _pages[
          _selectedIndex], // Affiche la page correspondant à l'onglet sélectionné
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Onglet actuellement sélectionné
        onTap: _onItemTapped, // Appelé lorsqu'un onglet est tapé
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Générer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        selectedItemColor: Color.fromARGB(
            255, 15, 212, 252), // Couleur de l'onglet sélectionné
        unselectedItemColor:
            Colors.grey, // Couleur des onglets non sélectionnés
      ),
    );
  }
}
