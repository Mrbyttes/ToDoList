import 'package:flutter/material.dart';

class Authentification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentification"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.login),
              iconSize: 80,
              color: Colors.black45,
              onPressed: () {
                // Action à effectuer lors du clic sur l'icône
                print("Authentification cliquée");
              },
            ),
            SizedBox(height: 20),
            Text(
              "Authentification de l'utilisateur",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
