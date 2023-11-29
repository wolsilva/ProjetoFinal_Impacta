import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cep-page.dart';
import 'login_page.dart';

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({Key? key}) : super(key: key);

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();

}

  class _ChecagemPageState extends State<ChecagemPage> {

  StreamSubscription? streamSubscription;

    @override
    initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute (
            builder: (context) => const LoginPage(),
      ),
     );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute (
            builder: (context) => const CepPage(),
          ),
          );
      }
    });
  }

  @override
  void dispose(){
      streamSubscription!.cancel();
      super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),

      );
    }
  }

