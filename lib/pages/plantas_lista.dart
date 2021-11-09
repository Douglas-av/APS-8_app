import 'package:app_plantas_aps8/api_gateway/plantas_service.dart';
import 'package:app_plantas_aps8/components/planta_item.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:flutter/material.dart';

class PlantaLista extends StatefulWidget {
  const PlantaLista({Key? key}) : super(key: key);

  @override
  State<PlantaLista> createState() => _PlantaListaState();
}

class _PlantaListaState extends State<PlantaLista> {
  bool requestError = false;

  late Future<List<PlantasModel>> futurePlantas;

  Future<void> futureState() async {
    final String continente = ModalRoute.of(context)!.settings.arguments as String;
    futurePlantas = PlantaService().buscaPlantasContinente(continente);
  }

  @override
  Widget build(BuildContext context) {
    futureState();
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            'Plantas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: FutureBuilder<List<PlantasModel>>(
        future: futurePlantas,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.toString()),
            );
          } else if (snapshot.hasData) {
            return GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                padding: const EdgeInsets.all(15.0),
                children: snapshot.data!
                    .map((plantasModel) => PlantaItem(plantasModel))
                    .toList());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
