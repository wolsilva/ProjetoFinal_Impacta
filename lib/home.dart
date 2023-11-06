import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Column, ElevatedButton, MainAxisAlignment, Navigator, Scaffold, StatefulWidget, MaterialApp, StatelessWidget, Text, Widget;

import 'package:flutter/src/widgets/basic.dart';
// ignore: unused_import
import 'Mapa.dart';
import 'package:localizafeira/controllers/cep_provider.dart';
import 'package:localizafeira/cep-page.dart';
import 'package:flutter/src/widgets/framework.dart' show BuildContext, State, StatefulWidget, StatelessWidget, Widget;
import 'main.dart' show MyApp;
import 'cep-page.dart' show CepPage;


class Home extends StatelessWidget {
  const Home({super.key});

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
            child: Text('Localizar no mapa'),
           onPressed: () {
             Navigator.pushNamed(context, '/primeira');
           },
         ),

          ElevatedButton(
            child: Text('Cadastrar Feira'),
            onPressed: () {
              var pushNamed = Navigator.pushNamed(context, '/segunda');
            },
          ),
     ],
      ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
}
