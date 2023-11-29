import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localizafeira/components/container_widget.dart';
import 'package:localizafeira/components/text_form_widget.dart';
import 'package:localizafeira/components/text_widget.dart';
import 'package:localizafeira/controllers/cep_provider.dart';
import 'package:localizafeira/utils/validate_cep.dart';
import 'package:provider/provider.dart' show Consumer;

import '../constants/string_constants.dart';
import 'home.dart';


class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController numController = TextEditingController();

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();



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
            key: formKey,
            child: Consumer<CepProvider>(builder: (context,
                provider,
                child,) {
              return Column(
                children: [
                  const SizedBox(height: 30),
                  _areaCep(formKey, provider),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _areaEndereco(),
                      const SizedBox(width: 5),
                      _areaNumero(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _areaBairro(),
                  const SizedBox(height: 10),
                  _areaLocalidade(),
                  const SizedBox(height: 20),
                  _btnSalvar(),
                  const SizedBox(height: 20),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(void Function() clearCampos) {
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
          onPressed: () {
            sair();
            //Navigator.pop(context);
          },
          icon: const Icon(
            Icons.sailing_rounded,
            size: 25,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  _areaCep(GlobalKey<FormState> formKey, CepProvider provider) {
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
            if (formKey.currentState!.validate()) {
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
        child: const Text(
          StringConstants.save,
          style: AppTextStyle.MainText,
        ),

      ),
    );

  }

  sair() async{
    await _firebaseAuth.signOut().then (
          (user) =>
          Navigator.pushReplacement(
            context,
            MaterialPageRoute (
              builder: (context) => const Home(),
            ),
          ),
    );
  }

}





