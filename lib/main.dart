import 'package:flutter/material.dart';
import 'models/Carro.dart';
import 'models/Destino.dart';
import 'models/PrecioCombustible.dart';
import 'pantallas/Pantalla.dart';

void main() {
  runApp(Viagem());
}

class Viagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cálculo de valor de viaje',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Pantalla(),
    );
  }
}