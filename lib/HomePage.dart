import 'package:flutter/material.dart';
import 'package:hnapp/Settings.dart';

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
            // Juste un exemple d'action
            print("Authentification");
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
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          // Action à effectuer lors du clic sur l'icône de menu
          print("Menu cliqué");
        },
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {
              print("Historique");
            },
            icon: Icon(Icons.preview),
            iconSize: 70,
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
