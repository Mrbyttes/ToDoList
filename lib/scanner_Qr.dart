import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 7, 78, 119), // Couleur de l'AppBar
              Colors.white, // Couleur du Body
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(60), // Hauteur de l'AppBar
              child: Container(
                // Couleur de l'AppBar
                alignment: Alignment.center,
                child: SafeArea(
                  child: Text(
                    'Scanner QR Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: MobileScanner(
                onDetect: (capture) async {
                  final List<Barcode> barcodes = capture.barcodes;
                  if (barcodes.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page_Apres(barcodes: barcodes),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page_Apres extends StatelessWidget {
  final List<Barcode> barcodes;
  const Page_Apres({Key? key, required this.barcodes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Résultats du scan'),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
          ),
          backgroundColor: Color.fromARGB(255, 68, 199, 255),
          body: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(116, 192, 255, 1).withOpacity(0.2),
              ),
              child: ListView.builder(
                itemCount: barcodes.length,
                itemBuilder: (context, index) {
                  final barcode = barcodes[index];
                  if (barcode.rawValue == null) {
                    return const Text(
                        'Valeur du Qr Null'); // Ignore les codes-barres sans valeur brute
                  } else {
                    return ListTile(
                      title:
                          Text(barcode.displayValue ?? 'Valeur non disponible'),
                      subtitle: Text(
                          'Format : ${barcode.format}, Type : ${barcode.type}'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      subtitleTextStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 249, 249, 249)),
                    );
                  }
                },
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final barcode = barcodes[0]; // Prendre le premier code-barres
              if (barcode.rawValue != null) {
                final url = barcode.displayValue!;
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(
                      Uri.parse(url)); // Ouvrir l'URL dans le navigateur
                } else {
                  print('URL invalide : $url');
                }
              }
            },
            child: Icon(Icons.open_in_browser),
            backgroundColor: Color.fromARGB(255, 7, 78, 119),
          ),
        ));
  }
}
