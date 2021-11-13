import 'package:app_plantas_aps8/components/type_tag.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/app_config.dart';
import 'package:flutter/material.dart';

class PlantaInfo extends StatelessWidget {
  final double fontSizeFloatingText = 14;

  const PlantaInfo({Key? key}) : super(key: key);

  List<TypeTag> getTypeTags(PlantasModel planta) {
    List<TypeTag> typeTags = [];

    if (planta.tipo == "Arvore") {
      typeTags.add(const TypeTag("Arvore", Colors.brown));
    } else if (planta.tipo == "Arbustro") {
      typeTags.add(const TypeTag("Arbusto", Colors.green));
    } else if (planta.tipo == "Flor") {
      typeTags.add(TypeTag("Flor", Colors.redAccent.shade100));
    } else if (planta.tipo == "Fruta") {
      typeTags.add(const TypeTag("Fruta", Colors.orange));
    } else {
      typeTags.add(const TypeTag("?", Colors.black54));
    }
    return typeTags;
  }

  @override
  Widget build(BuildContext context) {
    final PlantasModel planta = ModalRoute.of(context)!.settings.arguments as PlantasModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          planta.familia,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
          ),
          maxLines: 1,
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Image.network(
                AppConfig.apiBaseURL + '/imagem/' + planta.numero.toString(),
              ),
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                planta.nome_popular,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...getTypeTags(planta),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          planta.origem.toString(),
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "Origem",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          planta.altura_media.toString(),
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "Tamanho",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: const BorderRadius.all(Radius.circular(35)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Descrição",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  Container(
                    height: 140,
                    padding: const EdgeInsets.all(15),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        child: Text(
                          planta.descricao,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
