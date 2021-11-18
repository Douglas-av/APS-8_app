import 'package:app_plantas_aps8/components/card_continentes.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:flutter/material.dart';

class Continentes extends StatelessWidget {
  List<String> continentes = ["Africa", "America", "Asia", "Europa", "Oceania"];
  late Future<List<PlantasModel>> future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade900,
          title: Container(
            width: 200,
            margin: EdgeInsets.all(28),
            child: Text(
              "Flora",
              style: TextStyle(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: continentes
              .map((continente) => CardContinentes(continente))
              .toList(),
        ));
  }
}
