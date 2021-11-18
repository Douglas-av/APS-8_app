import 'package:app_plantas_aps8/api_gateway/plantas_service.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List parametros;
  bool putText;
  PlantaService plantaService = new PlantaService();
  TextEditingController controller = TextEditingController();
  late Future _future;
  var x;

  InputText({required this.parametros, required this.putText});

  void _inputTextUpdate(Map parametros, BuildContext context) {
    List lista = [];
    print('_inputText ---$parametros');
    parametros.forEach((key, value) {
      this.parametros[1] = value;
      this.parametros[5] = true;
    });
    putText = true;
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(
      AppRoutes.novaPlanta,
      arguments: parametros,
    );
  }

  Widget build(BuildContext context) {
    String labelText = parametros[0];
    String initalText = parametros[1].toString();
    String isEmptyText = parametros[2];
    TextInputType keyboardType = parametros[3];
    controller.text = parametros[5] ? initalText : '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) async => {
            if (!focus && labelText == 'Numero' && controller.text != '0')
              {
                _inputTextUpdate(
                    await plantaService.buscaPlantaId(controller.text),
                    context),
              }
            else
              {null}
          },
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            key: _formKey,
            autofocus: true,
            keyboardType: keyboardType,
            // initialValue: initalText,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(250, 224, 199, 0.6),
              filled: true,
              focusColor: Colors.green,
              hoverColor: Colors.yellow,
              hintText: 'Ex: $initalText',
              label: Text(
                labelText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return isEmptyText;
              }
              parametros[4] = controller.text;
              return null;
            },
          ),
        ),
      ),
    );
  }
}
