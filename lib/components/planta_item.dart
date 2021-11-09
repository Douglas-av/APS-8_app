// ignore_for_file: file_names

import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/app_config.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlantaItem extends StatelessWidget {
  final PlantasModel planta;

  const PlantaItem(this.planta, {Key? key}) : super(key: key);

  void _selectAnimal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.plantaInfo,
      arguments: planta,
    );
  }

  List<Color> getColors() {
    List<Color> colors = [];
    colors.add(Colors.green.withOpacity(0.5));
    colors.add(Colors.green);
    return colors;
  }

  Widget getImage() {
    return Image(
      image: NetworkImage(
          AppConfig.apiBaseURL + '/imagem/' + planta.numero.toString()),
      height: 115,
      width: 200,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 100.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectAnimal(context);
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
          gradient: LinearGradient(
            colors: [...getColors()],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5.0),
      ),
    );
  }
}
