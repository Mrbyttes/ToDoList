import 'package:flutter/material.dart';

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
      actions: [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            // Juste un exemple d'action
            print("Authentification");
          },
        ),
        IconButton(
            onPressed: () {
              // Juste un exemple d'action
              print("Bouton Paramettre");
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ))
      ],
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("QSafe"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CorpDePage extends StatelessWidget {
  Widget build(BuildContext context) {
    // Gross conteneur pour le corps de la page
    return Container(
        //Alignement du corps de la page
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        onPressed: () {
          print("Historique");
        },
        icon: Icon(Icons.preview),
        iconSize: 80,
        color: Colors.black45,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              print("galery");
            },
            icon: Icon(Icons.photo_library),
            iconSize: 85,
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              print("Appareil photo");
            },
            icon: Icon(Icons.photo_camera),
            iconSize: 85,
            color: Colors.blue,
          ),
        ],
      )
    ]));
  }
}
