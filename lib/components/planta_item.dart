// ignore_for_file: file_names

import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/app_config.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlantaItem extends StatelessWidget {
  final PlantasModel planta;
  final Color borderColor = Colors.transparent;
  const PlantaItem(this.planta, {Key? key}) : super(key: key);

  void _selectPlanta(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.plantaInfo,
      arguments: planta,
    );
  }

  List<Color> getColors() {
    List<Color> colors = [];
    if (planta.tipo == 'Flor') {
      colors.add(Colors.orange);
    }
    else if (planta.tipo == 'Arbustro') {
      colors.add(Colors.green.shade700);
    }
    else if (planta.tipo == 'Arvore') {
      colors.add(Colors.brown.shade900);
    }
    else if (planta.tipo == 'Fruta') {
      colors.add(Colors.redAccent.shade100);
    }
    else {
      colors.add(Colors.black);
    }
    colors.add(Colors.lightGreen.shade200.withOpacity(0.5));
    return colors;
  }

  Widget getImage() {
    return Image(
      image: NetworkImage(
          AppConfig.apiBaseURL + '/imagem/' + planta.numero.toString()),
      height: 115,
      width: 200,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: InkWell(
        onTap: () {
          _selectPlanta(context);
        },
        borderRadius: BorderRadius.circular(15),
        //splashColor: Theme.of(context).primaryColor,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 15,
                child: Text(planta.nome_popular,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
              Container(
                child: Center(
                  child: getImage(),
                ),
                height: 120,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                width: 50,
                child: Text("#" + planta.numero.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black)),
              )
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2.5,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              colors: [...getColors()],
              begin: Alignment.center,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(5.0),
        ),
      ),
    );
  }
}
