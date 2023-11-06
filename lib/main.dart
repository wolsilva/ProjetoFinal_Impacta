//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
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
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:flutter_config/flutter_config.dart';
import 'controllers/cep_provider.dart';

//import 'package:http/http.dart' as http;


import 'Mapa.dart';
import 'cep-page.dart';
import 'controllers/cep_provider.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  //runApp(const MyApp());
  runApp(ChangeNotifierProvider<CepProvider>(
      create: (_) => CepProvider(),
  child: const App(),
  ));
  /*runApp(ChangeNotifierProvider<FeirasRepository>(
    create: (_) => FeirasRepository(),
    child: const App(),
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                                     <--- MultiProvider
        providers: <SingleChildWidget>[
        //ChangeNotifierProvider<CepProvider>(create: (context) => CepProvider()),
         ChangeNotifierProvider<CepProvider>.value(
            value: CepProvider(),
          ),
          ChangeNotifierProvider<FeirasRepository>.value(
            value: FeirasRepository(),
          ),
        //ChangeNotifierProvider(create: (context) => FeirasRepository()),
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
        '/segunda': (context) => const CepPage(), },
    );
  }
}
/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cadastrar Feira';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Digite o CEP'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite algo';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite a rua ou avenida'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, info';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Digite o bairro'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, info';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Digite a cidade'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, info';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Digite o Estado'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, info';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}*/
