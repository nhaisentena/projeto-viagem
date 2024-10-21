import 'package:flutter/material.dart';
import '../models/Carro.dart';
import '../models/Destino.dart';
import '../models/PrecioCombustible.dart';

class Pantalla extends StatefulWidget {
  @override
  _PantallaState createState()=> _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  final _carroController = TextEditingController();
  final _autonomiaController = TextEditingController();
  final _destinoController = TextEditingController();
  final _distanciaController = TextEditingController();
  final _precioController= TextEditingController();
  final _combustibleController= TextEditingController();
  String resultado='';

  void calcularCosto() {
    final String nombreCarro = _carroController.text;
    final double autonomia= double.parse(_autonomiaController.text);
    final String destinoNombre = _destinoController.text;
    final double distancia = double.parse(_distanciaController.text);
    final double precioPorLitro = double.parse(_precioController.text);


    Carro carro = Carro(nombre: nombreCarro, autonomia: autonomia);
    Destino destino = Destino(identificacion: destinoNombre, distanciaKm: distancia);
    PrecioCombustible precioCombustible = PrecioCombustible(
      precioPorLitro: precioPorLitro,
      combustible: _combustibleController.text,
    );



    double litrosNecesarios= destino.distanciaKm/carro.autonomia;
    double costoViaje= litrosNecesarios*precioCombustible.precioPorLitro;

    setState(() {
      resultado = 'El valor del viaje es: \$${costoViaje.toStringAsFixed(2)}';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de valor de viaje'),
      ),
      backgroundColor: Colors.red[100],

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(

              controller: _carroController,
              decoration: InputDecoration(labelText: 'Nombre del carro'),
            ),
            TextField(
              controller: _autonomiaController,
              decoration: InputDecoration(labelText: 'Autonomía (km/litro)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _destinoController,
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            TextField(
              controller: _distanciaController,
              decoration: InputDecoration(labelText: 'Distancia (km)'),

              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _precioController,
              decoration: InputDecoration(labelText: 'Precio del combustible (por litro)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _combustibleController,
              decoration: InputDecoration(labelText: 'Tipo de combustible'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularCosto,
              child: Text(
                'Calcular valor del viaje',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
              ),
            ),
            SizedBox(height: 20),
            Text(
              resultado,

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}