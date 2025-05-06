import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  final String data; // Données à encoder dans le QR Code

  QrPage({required this.data}); // Constructeur pour recevoir les données

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(116, 192, 255, 1).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "QR Code généré",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              QrImage(
                data: data, // Données à encoder dans le QR Code
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Retour à la page précédente
                },
                child: Text("Retour"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 7, 78, 119),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QrImage extends StatelessWidget {
  final String data; // Données à encoder dans le QR Code
  final int version; // Version du QR Code
  final double size; // Taille du QR Code
  final bool gapless; // Indique si le QR Code doit être sans espace

  QrImage({
    required this.data,
    required this.version,
    required this.size,
    required this.gapless,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          data, // Affiche les données au lieu du QR Code
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ); // Placeholder pour le QR Code
  }
}
