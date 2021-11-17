import 'package:app_plantas_aps8/pages/continentes.dart';
import 'package:app_plantas_aps8/pages/home.dart';
import 'package:app_plantas_aps8/pages/inserir_planta.dart';
import 'package:app_plantas_aps8/pages/planta_info.dart';
import 'package:app_plantas_aps8/pages/plantas_lista.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:app_plantas_aps8/utils/parametros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  Parametros parametros = new Parametros();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home: (context) => Home(),
        AppRoutes.continentes: (context) => Continentes(),
        AppRoutes.novaPlanta: (context) => InserirPlanta(parametros: parametros, update: parametros.parametrosExemplo['numero'][5]),
        AppRoutes.plantaLista: (context) => PlantaLista(),
        AppRoutes.plantaInfo: (context) => PlantaInfo(),
      },
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
