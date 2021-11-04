import 'package:app_plantas_aps8/api_gateway/plantas_service.dart';
import 'package:app_plantas_aps8/components/planta_item.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:flutter/material.dart';

class PlantaListScreen extends StatefulWidget {
  const PlantaListScreen({Key? key}) : super(key: key);

  @override
  State<PlantaListScreen> createState() => _PlantaListScreenState();
}

class _PlantaListScreenState extends State<PlantaListScreen> {
  bool requestError = false;

  late Future<List<PlantasModel>> futurePlantas;

  @override
  void initState() {
    super.initState();
    futurePlantas = PlantaService().buscaPlantas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            'Animais',
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
                    .map((PlantasModel) => PlantaItem(PlantasModel))
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
