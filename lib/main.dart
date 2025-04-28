import 'package:flutter/material.dart';
import 'package:hnapp/start.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QSafe",
      home: const Demarrage(),
    );
  }
}
