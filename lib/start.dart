import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qsafe/page_Principale.dart';

class Demarrage extends StatefulWidget {
  const Demarrage({super.key});
  State<Demarrage> createState() => _Demarrage();
}

class _Demarrage extends State<Demarrage> with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 20),
      Text(
        "Monkey Lab Studio",
        style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20),
      Image.asset(
        'assets/MonkeyLab.png',
        width: 200,
        height: 200,
      ),
    ]));
  }
}
