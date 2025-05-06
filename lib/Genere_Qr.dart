import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qsafe/Page_Apres_Gen.dart';

class GenererQrPage extends StatefulWidget {
  @override
  _GenererQrPageState createState() => _GenererQrPageState();
}

class _GenererQrPageState extends State<GenererQrPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(116, 192, 255, 1).withOpacity(0.2),
        ),
        child: Column(
          children: [
            Text(
              "Entrez un texte ou une URL pour générer un QR Code",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Texte ou URL",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer un texte ou une URL";
                  }
                  return value;
                },
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Naviguer vers la page d'affichage du QR Code
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrPage(data: _textController.text),
                    ),
                  );
                  print("object");
                  print(_textController
                      .text); // Afficher le texte dans la console
                }
                print("object");
                print(
                    _textController.text); // Afficher le texte dans la console
              },
              child: Text("Générer le QR Code"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 97, 194, 250),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
