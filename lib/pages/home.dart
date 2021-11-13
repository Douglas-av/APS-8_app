import 'package:app_plantas_aps8/components/button_continentes.dart';
import 'package:app_plantas_aps8/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _selectContinentes(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.continentes,
    );
  }

  void _selectInserirPlanta(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.nova_planta,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromRGBO(250, 224, 199, 1),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-home4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
