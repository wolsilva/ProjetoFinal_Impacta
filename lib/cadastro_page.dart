import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localizafeira/checagem_login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final _nomelController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body:  ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _nomelController,
            decoration: const InputDecoration(
              label: Text('Nome completo')
            ),//inputDecoration
          ),//TextFormfield
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                label: Text('E-mail')
            ),//inputDecoration
          ),//TextFormfield
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
                label: Text('Digite a senha')
            ),//inputDecoration
          ),//TextFormfield
        ElevatedButton(onPressed: () {
          cadastrar();
        }, child: const Text ('Cadastrar'),
        ),
      ],
      ),
    );
  }
  cadastrar() async{
      try{
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        if(userCredential != null){
          userCredential.user!.updateDisplayName(_nomelController.text);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ChecagemPage(),
          ),
                  (route) => false);
        }
      }on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Crie uima senha mais forte'),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Este e-mail já está em uso'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
  }
}
