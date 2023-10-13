import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Colors,
        ElevatedButton,
        MaterialPageRoute,
        Navigator,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

//import 'package:flutter/src/widgets/basic.dart';
// ignore: unused_import
import 'Mapa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela inicial'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text(
              "Localizar no mapa",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Mapa()))),
      ),
    );
  }
}
