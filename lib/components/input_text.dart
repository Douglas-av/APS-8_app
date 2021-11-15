import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List parametros;

  InputText(this.parametros);

  Widget build(BuildContext context) {
    String labelText = parametros[0];
    TextEditingController controller = TextEditingController(text: parametros[1]);
    String initalText = parametros[1];
    String isEmptyText = parametros[2];
    TextInputType keyboardType = parametros[3];

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: TextFormField(
        controller: controller,
        key: _formKey,
        autofocus: true,
        keyboardType: keyboardType,
        // initialValue: initalText,
        textInputAction: TextInputAction.next,
        onTap: () {
          if (initalText.isNotEmpty) {
            initalText = '';
          }
        },
        decoration: InputDecoration(
          hintText: 'Aloha',
          labelText: labelText,
        ),
        validator: (value) {
          print(controller.text);
          if (value!.isEmpty) {
            return isEmptyText;
          }
          return null;
        },
      ),
    );
  }
}
