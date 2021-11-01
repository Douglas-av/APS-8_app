import 'dart:convert';

import 'package:app_plantas_aps8/models/plantasModel.dart';
import 'package:http/http.dart' as http;

class PlantasService {
  final String _baseURL = "http://10.0.2.2:5000";

  Future<List<Plantas>> buscaPlantas() async {
    final response =
        await http.get(Uri.parse(_baseURL + '/plantas'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Plantas> animals =
          body.map((dynamic item) => Plantas.fromJson(item)).toList();
      return animals;
    } else {
      throw "Falha para buscar Plantas.";
    }
  }
}
