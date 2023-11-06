import 'package:flutter/material.dart';
import 'models/feira.dart';
import 'package:localizafeira/models/feira.dart' show Feira;

// ignore: must_be_immutable
class FeiraDetalhes extends StatelessWidget {
  Feira feira;
  FeiraDetalhes({Key? key, required this.feira}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Text(
            feira.nome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24),
          child: Text(
            feira.endereco,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24),
          child: Text(
            feira.dia,
          ),
        ),
      ],
    );
  }
}
