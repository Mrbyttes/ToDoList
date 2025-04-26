import 'package:flutter/material.dart';
import 'package:hnapp/main.dart';

class HomePage extends StatelessWidget {
  // La page d'accueil avec la barre du haut et le corps vide
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaBarreDuHaut(),
      body: Container(),
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
            print("Bouton à droite pressé !");
          },
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("QSafe"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
