//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:localizafeira/home.dart' show Home;
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizafeira/repositories/feiras_repository.dart';
//import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
//import 'package:flutter_config/flutter_config.dart';
import 'checagem_login_page.dart' show ChecagemPage;
import 'controllers/cep_provider.dart';
import 'firebase_options.dart';
//import 'package:http/http.dart' as http;

import 'Mapa.dart';
import 'cep-page.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
       );

  //runApp(const MyApp());
  runApp(ChangeNotifierProvider<CepProvider>(
      create: (_) => CepProvider(),
  child: const App(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                                     <--- MultiProvider
        providers: <SingleChildWidget>[

         ChangeNotifierProvider<CepProvider>.value(
            value: CepProvider(),
          ),
          ChangeNotifierProvider<FeirasRepository>.value(
            value: FeirasRepository(),
          ),

        ],

    );


  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela inicial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: Home(),
      initialRoute: '/',
      routes: {'/' : (context) => const Home(), '/primeira': (context) => Mapa(),
        '/segunda': (context) => const CepPage(), '/terceira': (context) => const ChecagemPage(), },
    );
  }
}
