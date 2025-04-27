import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Paramètres"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 80,
                color: Colors.black45,
                onPressed: () {
                  // Action à effectuer lors du clic sur l'icône
                  print("Paramètres cliqués");
                },
              ),
              SizedBox(height: 20),
              Text(
                "Paramètres de l'application",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
