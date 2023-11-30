import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Column, ElevatedButton, MainAxisAlignment, Navigator, Scaffold, StatelessWidget, Text, Widget;

//import 'package:flutter/src/widgets/basic.dart';
// ignore: unused_import
import 'Mapa.dart';

//import 'package:localizafeira/controllers/cep_provider.dart';
//import 'package:localizafeira/cep-page.dart';
//import 'main.dart' show MyApp;


class Home extends StatelessWidget {
  const Home({super.key});

  //final _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela inicial'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
         ElevatedButton(
            child: const Text('Localizar no mapa'),
           onPressed: () {
           Navigator.pushNamed(context, '/primeira');
           },
         ),

          ElevatedButton(
            child: const Text('Cadastrar Feira'),
            onPressed: () {
              Navigator.pushNamed(context, '/terceira');
            },
          ),


     ],
      ),
      ),
    );
  }

}




