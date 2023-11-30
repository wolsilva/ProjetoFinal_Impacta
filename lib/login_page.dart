import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'cep-page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina de login'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('e-mail'),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('password'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('Entrar'),
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CadastroPage(),));
            }, child: const Text('Cadastrar uauário'),),
          ],
        )
    );
  }


  login() async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CepPage(),
          ),
        );
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario(a) não localizado'),
              backgroundColor: Colors.redAccent,
            )
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Senha inválida'),
              backgroundColor: Colors.redAccent,
            )
        );
      }
    }
  }
}

