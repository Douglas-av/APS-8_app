import 'package:app_plantas_aps8/api_gateway/plantas_service.dart';
import 'package:app_plantas_aps8/models/plantas_model.dart';
import 'package:app_plantas_aps8/utils/parametros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_text.dart';

class FormPlanta extends StatelessWidget {
  GlobalKey<FormState> _key = new GlobalKey();
  Parametros parametros = new Parametros();
  PlantaService plantaService = new PlantaService();
  late PlantasModel planta;

  List _inputText(Map parametros) {
    List<Widget> lista = [];
    parametros.values.forEach((value) {
      lista.add(InputText(parametros: value, putText: false));
    });
    return lista;
  }

  Map _postParametros(Map post) {
    Map<String, dynamic> parametros = {
      "numero": 11,
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
      if (key == 'numero') {
        parametros[key] = int.parse(post[key][4]);
      } else {
        parametros[key] = post[key][4];
      }
    });
    return parametros;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ..._inputText(parametros.parametrosExemplo),
              Row(
                children: [
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
                      child: Text('Cadastrar nova planta',
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ),
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
                                  'Informação alterada com sucesso!',
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
                                'Erro ao alterar a informação.',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(milliseconds: 3500),
                            ));
                          }
                        }
                        print('oi');
                      },
                      child: Text('Alterar planta existente',
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
