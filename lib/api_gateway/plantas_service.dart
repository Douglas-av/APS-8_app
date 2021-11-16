import 'dart:async';
import 'dart:convert';

import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:http/http.dart' as http;

class PlantaService {
  final String _baseURL = "http://10.0.2.2:5000";

  Future<List<PlantasModel>> buscaPlantas() async {
    final response = await http.get(Uri.parse(_baseURL + '/plantas'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<PlantasModel> plantas =
          body.map((dynamic item) => PlantasModel.fromJson(item)).toList();
      return plantas;
    } else {
      throw "Falha para buscar Plantas.";
    }
  }

  Future<List<PlantasModel>> buscaPlantasContinente(String continente) async {
    final response =
        await http.get(Uri.parse(_baseURL + '/plantas/' + continente));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<PlantasModel> plantas =
          body.map((dynamic item) => PlantasModel.fromJson(item)).toList();
      return plantas;
    } else {
      throw "Falha para buscar Plantas.";
    }
  }

  Future<PlantasModel> postPlanta(Map parametros) async {
    print('---$parametros');
    final response = await http.post(Uri.parse(_baseURL + '/plantas'),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(parametros));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<PlantasModel> plantas =
          body.map((dynamic item) => PlantasModel.fromJson(item)).toList();
      return plantas.last;
    } else {
      throw "Falha para cadastrar Plantas.";
    }
  }
}
