/*
CODIGO ORIGINAL ANTES DE MUDAR DE STATE FULL PARA STATELESS

import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Column, ElevatedButton, MainAxisAlignment, MaterialPageRoute, Navigator, Scaffold, State, StatefulWidget, MaterialApp, StatelessWidget, Text, Widget;

import 'package:flutter/src/widgets/basic.dart';
// ignore: unused_import
import 'Mapa.dart';
import 'package:localizafeira/controllers/cep_provider.dart';
import 'package:localizafeira/cep-page.dart';
import 'package:flutter/src/widgets/framework.dart' show BuildContext, State, StatefulWidget, StatelessWidget, Widget;
import 'main.dart' show MyApp;
import 'cep-page.dart' show CepPage;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
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
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ElevatedButton(
            child: Text('Localizar no mapa'),
            onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Mapa()))),

          ElevatedButton(
            child: Text('Cadastrar Feira'),
            onPressed: () => Navigator.push(context as BuildContext,
                MaterialPageRoute(builder: (context) => CepPage()))),

     ],
      ))
    );
  }
}
---------------------
ARQUIVO HOME DEPOIS DO DAS IMPORTACOES
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
        children: [
         ElevatedButton(
            child: Text('Localizar no mapa'),
            onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Mapa()))),

          ElevatedButton(
            child: Text('Cadastrar Feira'),
            onPressed: () => Navigator.push(context as BuildContext,
                MaterialPageRoute(builder: (context) => CepPage()))),

     ],
      ))
    );
  }

  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
}
---------------
PAGINA CEP-PAGE
class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    void clearCampos() {
      cepController.clear();
      bairroController.clear();
      endController.clear();
      localController.clear();
      numController.clear();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(clearCampos),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Consumer<CepProvider>(builder: (
              context,
              provider,
              child,
            ) {
              return Column(
                children: [
                  SizedBox(height: 30),
                  _areaCep(_formKey, provider),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _areaEndereco(),
                      SizedBox(width: 5),
                      _areaNumero(),
                    ],
                  ),
                  SizedBox(height: 10),
                  _areaBairro(),
                  SizedBox(height: 10),
                  _areaLocalidade(),
                  SizedBox(height: 20),
                  _btnSalvar(),
                  SizedBox(height: 20),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(void clearCampos()) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        StringConstants.queryCep,
        style: TextStyle(color: Colors.red),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: clearCampos,
          icon: const Icon(
            Icons.refresh,
            size: 25,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon:const Icon(
            Icons.home,
            size: 25,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  _areaCep(GlobalKey<FormState> _formKey, CepProvider provider) {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.cep,
        StringConstants.enterCep,
        controller: cepController,
        validator: Validate().validarCep,
        icon: InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              provider.GetCep(cepController.text);

              bairroController.text = provider.bairro.toString();
              endController.text = provider.localidade.toString();
              localController.text = provider.endereco.toString();
            }
          },
          child: const Icon(
            Icons.search,
            size: 30,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  _areaEndereco() {
    return ContainerWidget(
      Alignment.center,
      55,
      200,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.adress,
        StringConstants.enterAdress,
        controller: localController,
      ),
    );
  }

  _areaNumero() {
    return ContainerWidget(
      Alignment.center,
      55,
      90,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.number,
        StringConstants.enterNumber,
        controller: numController,
      ),
    );
  }

  _areaBairro() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.district,
        StringConstants.enterDistrict,
        controller: bairroController,
      ),
    );
  }

  _areaLocalidade() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.locality,
        StringConstants.enterLocality,
        controller: endController,
      ),
    );
  }

  _btnSalvar() {
    return InkWell(
      onTap: () {},
      child: ContainerWidget(
        Alignment.center,
        55,
        double.infinity,
        color: Colors.red[900],
        child: Text(
          StringConstants.save,
          style: AppTextStyle.MainText,
        ),
      ),
    );
  }
}

 */


