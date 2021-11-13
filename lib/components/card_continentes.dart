import 'package:app_plantas_aps8/components/button_continentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContinentes extends StatelessWidget {
  final String continente;

  CardContinentes(this.continente);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(105),
        ),
        elevation: 15,
        child: ButtonContinentes(continente, 'assets/images/${continente}.png'),
      ),
    );
  }
}
