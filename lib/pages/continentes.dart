import 'package:app_plantas_aps8/components/card_continentes.dart';
import 'package:app_plantas_aps8/models/plantasModel.dart';
import 'package:flutter/material.dart';

class Continentes extends StatelessWidget {
  List<String> continentes = ["Africa", "America", "Asia", "Europa", "Oceania"];
  late Future<List<PlantasModel>> future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen.shade100,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade900,
          title: Container(
            width: double.infinity,
            margin: EdgeInsets.all(28),
            child: Text(
              "Flora Global",
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
