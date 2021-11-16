import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List parametros;

  InputText(this.parametros);

  Widget build(BuildContext context) {
    String labelText = parametros[0];
    TextEditingController controller = TextEditingController();
    String initalText = parametros[1];
    String isEmptyText = parametros[2];
    TextInputType keyboardType = parametros[3];

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
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
    );
  }
}
