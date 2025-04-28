import 'package:flutter/material.dart';
import 'package:hnapp/Settings.dart';
import 'package:hnapp/Authentification.dart';

class HomePage extends StatelessWidget {
  // La page d'accueil avec la barre du haut et le corps vide
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaBarreDuHaut(),
      body: Center(child: CorpDePage()),
    );
  }
}

class LaBarreDuHaut extends StatelessWidget implements PreferredSizeWidget {
  // La barre du haut avec le titre et le bouton à droite
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 7, 78, 119),
      actions: [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Authentification()),
            );
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => settings()),
            );
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        "QSafe",
        style:
            TextStyle(color: const Color.fromARGB(200, 0, 0, 0), fontSize: 20),
      ),
      leading: PopupMenuButton<int>(
        icon: Icon(Icons.menu, color: Colors.white), // Icône du menu
        onSelected: (value) {
          if (value == 1) {
            print("Historique sélectionné");
          } else if (value == 2) {
            print("Galerie sélectionnée");
          } else if (value == 3) {
            print("Appareil photo sélectionné");
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                Icon(Icons.preview, color: Colors.black45),
                SizedBox(width: 10),
                Text("Historique"),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: [
                Icon(Icons.photo_library, color: Colors.green),
                SizedBox(width: 10),
                Text("Galerie"),
              ],
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Row(
              children: [
                Icon(Icons.photo_camera, color: Colors.blue),
                SizedBox(width: 10),
                Text("Appareil photo"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CorpDePage extends StatelessWidget {
  Widget build(BuildContext context) {
    // Gross conteneur pour le corps de la page
    return Container(
        width: MediaQuery.of(context).size.width, // Largeur de l'écran
        height: MediaQuery.of(context).size.height, // Hauteur de l'écran
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Qr.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(1),
              BlendMode.dstATop,
            ),
          ),
        ),
        //Alignement du corps de la page
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Bienvenue dans QSafe",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton
                print("Bouton scanner un QR Code cliqué");
              },
              child: Text("Scanner un QR Code"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 78, 119),
                foregroundColor: Colors.white,
                shadowColor: Color.fromARGB(255, 7, 78, 119),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton
                print("Bouton séléctionner de la galerie cliqué");
              },
              child: Text("Séléctionner de la galerie"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 78, 119),
                foregroundColor: Colors.white,
                shadowColor: Color.fromARGB(255, 7, 78, 119),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton
                print("Bouton genérer QR Code cliqué");
              },
              child: Text("Générer un QR Code"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 78, 119),
                foregroundColor: Colors.white,
                shadowColor: Color.fromARGB(255, 7, 78, 119),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
