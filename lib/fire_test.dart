/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localizafeira/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference userRef =
      Firestore.instance.collection('Users').reference();
  String idGravado = "";

  void _incrementCounter() {
    var novoUsuario = {
      "nome": "João",
      "sobrenome": "Pereira",
      "endereco": "Rua endereco",
      "numero": "000",
      "telefones": {"principal ": " (42)2222222", "secundario": " (42)2222222"},
    };
    userRef.add(novoUsuario).then((val) {
      print(val.documentID);
      setState(() {
        idGravado = val.documentID;
      });
    });
  }

  TextEditingController nome = TextEditingController(text: "");
  TextEditingController endereco = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inputField(nome,
                labelText: "Nome",
                hintText: "Digite o nome do usuário",
                icone: Icons.person),
            inputField(endereco,
                labelText: "Endereço",
                hintText: "Digite o nome endereço",
                icone: Icons.map),
            inputField(email,
                labelText: "Email",
                hintText: "Digite o email",
                icone: Icons.email,
                tipo: TextInputType.emailAddress),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget inputField(TextEditingController text,
      {String hintText = "",
      String labelText = "",
      IconData icone = Icons.person,
      TextInputType tipo = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: text,
        keyboardType: TextInputType.text,
        autovalidateMode: true,
        autocorrect: true,
        validator: (val) {
          print(val);
          if (val!.length < 3) {
            return "Muito curto";
          }
          if (labelText == "Email") {
            return validateEmail(val);
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icone),
          labelText: labelText,
        ),
      ),
    );
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Digite um e-mail válido';
    else
      // ignore: curly_braces_in_flow_control_structures
      return null;
  }
}
*/