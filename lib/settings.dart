import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Paramètres",
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 7, 78, 119).withOpacity(0.8)),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
