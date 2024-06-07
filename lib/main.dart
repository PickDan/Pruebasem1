import 'package:flutter/material.dart';
import 'package:prueba_01/ejercicio1.dart';
import 'package:prueba_01/ejercicio2.dart';

void main() {
  runApp(Evaluacion1());
}

class Evaluacion1 extends StatelessWidget {
  const Evaluacion1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ventana principal",
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
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Principal(), Ejercicio1()];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('https://www.androidsis.com/wp-content/uploads/2009/06/fondo-de-pantalla-3d-8.jpeg')
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        backgroundColor: Colors.amberAccent,
        body: screens[indice],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indice,
          onTap: (value) {
            setState(() {
              indice = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Principal"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Ejercicio 1")
          ],
        ),
      ),
    );
  }
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Sebastián Pilamunga", style: TextStyle(fontSize: 20))),
        Center(child: Text("PickDan", style: TextStyle(fontSize: 20))),
        BotonEjercicio()
      ],
    );
  }
}

class BotonEjercicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Ir al ejercicio 2"),
    );
  }
}

void alerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("¿Desea ir al ejercicio 2?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cierra el cuadro de diálogo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Ejercicio2()),
              );
            },
            child: Text("Aceptar"),
          ),
        ],
      );
    },
  );
}
