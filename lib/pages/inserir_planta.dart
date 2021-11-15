import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InserirPlanta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir Planta"),
      ),
      body: Form(
        child: Container(
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                initialValue: "olar",
                
                decoration: InputDecoration(
                  labelText: 'Nome da Planta',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome da Planta';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome da Planta',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome da Planta';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print('oi');
                  Navigator.pop(context);
                }, 
              child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
