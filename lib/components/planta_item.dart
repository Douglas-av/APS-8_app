import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/app_config.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlantaItem extends StatelessWidget {
  final PlantasModel planta;

  const PlantaItem(this.planta, {Key? key}) : super(key: key);

  void _selectPlanta(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.plantaInfo,
      arguments: planta,
    );
  }

  Widget getImage() {
    return Image(
      image: NetworkImage(
          AppConfig.apiBaseURL + '/images/' + planta.numero.toString()),
      height: 120,
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
        _selectPlanta(context);
      },
      borderRadius: BorderRadius.circular(15),
      //splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Column(
          children: [
            Text(planta.nome_popular,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
            getImage(),
            Container(
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
            colors: [
               Colors.lightGreen.shade100,
            ],
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
