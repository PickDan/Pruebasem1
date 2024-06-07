import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';

void main(){
  runApp(Ejercicio2());
}

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ejercicio 2",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Ejercicio 2"),
      ),
      body: Body(context),
      
    );
  }
}

Widget Body(context){
  return(
    Column(
      children: <Widget>[
        const Text("Ejercicio angular"),
        VelocidadAngular(),
        SizedBox(height: 20),
        BotonCalcular(context),
        SizedBox(height: 20),
        BotonSalir(context),
        SizedBox(height: 20),
      ],
    )
  );
}

final TextEditingController _velocidad = TextEditingController();
Widget VelocidadAngular(){
  return(
    TextField(
      controller: _velocidad,
      decoration: InputDecoration(
        hintText: "Ingrese la velocidad angular"
      ),
    )
  );
}


Widget BotonCalcular(context){
  return(
    FilledButton(onPressed: (){
      alerta(context);
    }, child: Text("Calcular"))
  );
}

double calcular(){
  double velocidad = double.tryParse(_velocidad.text) ?? 0.0;
  double tiempo = 25;
  double distancia = velocidad * tiempo;
  return distancia;
}

void alerta(context){
  showDialog(context: context, builder: 
  (context){
    return(AlertDialog(
      title: Text("La velocidad angular es: ${calcular()}"),
      actions: [
        TextButton(onPressed: (){
            Navigator.pop(context);
        }, child: Text("Aceptar"))
      ],
    ));
  }
  );
}

Widget BotonSalir(context){
  return(
    FilledButton(onPressed: (){
        irPrincipal(context);
    }, child: const Text("Salir al inicio"))
  );
}

void irPrincipal(context){
  Navigator.push(context, 
    MaterialPageRoute(builder:
      (context) => const Evaluacion1()
    )
  );
}