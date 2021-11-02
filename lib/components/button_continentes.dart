import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonContinentes extends StatelessWidget {
  final String continente;

  ButtonContinentes(this.continente);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                continente,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ), // button text
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade100,
              image: DecorationImage(
                  image: Image.asset(
                    "assets/images/${continente}.png",
                  ).image,
                  fit: BoxFit.fitHeight),
            )),
        onTap: () {
          print(continente);
        });
  }
}
