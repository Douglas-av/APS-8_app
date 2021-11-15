import 'package:app_plantas_aps8/components/input_text.dart';
import 'package:app_plantas_aps8/utils/parametros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
{"numero": 1, "nome_popular": "Pata de vaca", "nome_cientifico": "Bauhinia blakeana", "luminosidade": "Sol Pleno", "origem": "China", "continente": "Asia", "familia": "Fabaceae", "tipo": "Flor", "altura_media": "9m", "descricao": "\nA bau\u00ednia de hong kong \u00e9 uma bela \u00e1rvore semi dec\u00eddua, est\u00e9ril, resultante provavelmente da hibridiza\u00e7\u00e3o entre as esp\u00e9cies Bauhinia variegata e Bauhinia purpurea. Ela \u00e9 end\u00eamica e origin\u00e1ria de Hong Kong, al\u00e9m de sua flor ser o s\u00edmbolo que estampa a bandeira da cidade. Seu porte \u00e9 m\u00e9dio e o crescimento \u00e9 r\u00e1pido, alcan\u00e7ando de 6 a 12 metros de altura por 3 a 8 metros de largura de copa. Sua madeira \u00e9 mole, tornando a suscet\u00edvel a quebras em temporais e ataques de pragas."}
*/

class InserirPlanta extends StatelessWidget {
  GlobalKey<FormState> _key = new GlobalKey();

  List _inputText(Map parametros) {
    List<Widget> lista = [];
    parametros.values.forEach((value) {
      lista.add(InputText(value));
    });
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir Planta"),
      ),
      body: Form(
        key: _key,
        child: Container(
          child: Scrollbar(
            showTrackOnHover: true,
            child: ListView(
              children: [
                ..._inputText(Parametros.parametros),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_key.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        _key.currentState!.save();
                        print(Parametros.parametros['familia'][4]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processando informação...',
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(milliseconds: 1500),
                          )
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Finalizado',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(milliseconds: 3500),
                          )
                        );
                      }
                      print('oi');
                    },
                    child: Text('Salvar'),
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
