import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio1());
}

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ejercicio 1",
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Cohete"),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Column(
    children: <Widget>[
      const Text("Ejercicio cohete"),
      CampoAltura(),
      SizedBox(height: 20),
      CampoTiempo(),
      SizedBox(height: 20),
      BotonCalcular(context),
      SizedBox(height: 20),
    ],
  );
}

final TextEditingController _altura = TextEditingController();
Widget CampoAltura() {
  return TextField(
    controller: _altura,
    decoration: InputDecoration(
      hintText: "Ingrese la altura inicial",
    ),
  );
}

final TextEditingController _tiempo = TextEditingController();
Widget CampoTiempo() {
  return TextField(
    controller: _tiempo,
    decoration: InputDecoration(
      hintText: "Ingrese el tiempo",
    ),
  );
}

Widget BotonCalcular(context) {
  return ElevatedButton(
    onPressed: () {
      calcular(context);
    },
    child: Text("Calcular"),
  );
}

double calcular(BuildContext context) {
  double altura = double.tryParse(_altura.text) ?? 0.0;
  double tiempo = double.tryParse(_tiempo.text) ?? 0.0;
  double aceleracion = 20;

  double resultado = altura + (0.5 * aceleracion * tiempo * tiempo);

  String mensaje = (resultado >= 1000)
      ? 'Lanzamiento exitoso! Altura alcanzada: ${resultado} metros'
      : 'Lanzamiento fallido. Altura alcanzada: ${resultado} metros';

  alerta(context, mensaje);
  return resultado;
}

void alerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Aceptar"),
          )
        ],
      );
    },
  );
}
