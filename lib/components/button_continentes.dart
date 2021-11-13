import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonContinentes extends StatelessWidget {
  final String continente;
  final String pathImage;

  ButtonContinentes(this.continente, this.pathImage);

  void _selectPlantaLista(BuildContext context, String continente) {
    Navigator.of(context).pushNamed(
      AppRoutes.plantaLista,
      arguments: continente,
    );
  }

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
              image: pathImage.isEmpty ? null : DecorationImage(
                  image: Image.asset(
                    pathImage
                  ).image,
                  fit: BoxFit.fitHeight),
            )),
        onTap: () {
          _selectPlantaLista(context, continente);
        });
  }
}
