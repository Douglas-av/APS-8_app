import 'dart:convert';

import 'package:app_plantas_aps8/api_gateway/plantas_service.dart';
import 'package:app_plantas_aps8/components/input_text.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/parametros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
{"numero": 1, "nome_popular": "Pata de vaca", "nome_cientifico": "Bauhinia blakeana", "luminosidade": "Sol Pleno", "origem": "China", "continente": "Asia", "familia": "Fabaceae", "tipo": "Flor", "altura_media": "9m", "descricao": "\nA bau\u00ednia de hong kong \u00e9 uma bela \u00e1rvore semi dec\u00eddua, est\u00e9ril, resultante provavelmente da hibridiza\u00e7\u00e3o entre as esp\u00e9cies Bauhinia variegata e Bauhinia purpurea. Ela \u00e9 end\u00eamica e origin\u00e1ria de Hong Kong, al\u00e9m de sua flor ser o s\u00edmbolo que estampa a bandeira da cidade. Seu porte \u00e9 m\u00e9dio e o crescimento \u00e9 r\u00e1pido, alcan\u00e7ando de 6 a 12 metros de altura por 3 a 8 metros de largura de copa. Sua madeira \u00e9 mole, tornando a suscet\u00edvel a quebras em temporais e ataques de pragas."}
*/

class InserirPlanta extends StatelessWidget {
  GlobalKey<FormState> _key = new GlobalKey();
  Parametros parametros = new Parametros();
  PlantaService plantaService = new PlantaService();
  late PlantasModel planta;

  List _inputText(Map parametros) {
    List<Widget> lista = [];
    parametros.values.forEach((value) {
      lista.add(InputText(value));
    });
    return lista;
  }

  Map _postParametros(Map post) {
    Map<String, dynamic> parametros = {
      "numero": 0,
      "nome_popular": 0,
      "nome_cientifico": 0,
      "luminosidade": 0,
      "origem": 0,
      "continente": 0,
      "familia": 0,
      "tipo": 0,
      "altura_media": 0,
      "descricao": 0,
    };
    post.forEach((key, value) {
      parametros[key] = post[key][4];
    });
    return parametros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir/Alterar Planta"),
        backgroundColor: Color.fromRGBO(250, 224, 199, 1),
      ),
      body: Form(
        key: _key,
        child: Container(
          child: Scrollbar(
            showTrackOnHover: true,
            child: ListView(
              children: [
                ..._inputText(parametros.parametrosExemplo),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(250, 224, 199, 1)),
                      elevation: MaterialStateProperty.all<double>(5),
                      side: MaterialStateProperty.all(
                        BorderSide.lerp(
                            BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black54,
                              width: 2.0,
                            ),
                            BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffe4e978),
                              width: 2.0,
                            ),
                            2.0),
                      ),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_key.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        _key.currentState!.save();
                        Map dadosInput =
                            _postParametros(parametros.parametrosExemplo);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Processando informação...',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(milliseconds: 1500),
                        ));
                        try {
                          plantaService.postPlanta(dadosInput).then((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                'Informação inserida com sucesso!',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.green,
                              duration: Duration(milliseconds: 3500),
                            ));
                          });
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Erro ao inserir a informação.',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 3500),
                          ));
                        }
                      }
                      print('oi');
                    },
                    child:
                        Text('Enviar', style: TextStyle(color: Colors.black54)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
