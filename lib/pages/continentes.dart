import 'package:flutter/material.dart';

class Continentes extends StatelessWidget {
  final String texto;

  Continentes(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(105),
        ),
        elevation: 10,
        child: GestureDetector(
            child: Container(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    texto,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ), // button text
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage("https://placeimg.com/640/480/any"),
                      fit: BoxFit.cover),
                )),
            onTap: () {
              print(texto);
            }),
      ),
    );
  }
}
