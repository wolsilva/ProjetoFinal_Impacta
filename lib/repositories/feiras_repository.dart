import 'package:flutter/material.dart';
import 'package:localizafeira/models/feira.dart';

class FeirasRepository extends ChangeNotifier {
  final List<Feira> _feiras = [
    Feira(
      nome: 'Feira Livre 0',
      endereco: 'R. Batataes, 83 - Jardim Paulista',
      dia: 'Quarta-Feira',
      latitude: -23.5726747,
      longitude: -46.6588478,
    ),
    Feira(
      nome: 'Feira 1',
      endereco: 'R. Cap. Pinto Ferreira, 38 - Jardim Paulista',
      dia: 'Quarta-Feira',
      latitude: -23.5714724,
      longitude: -46.6547874,
    ),
    Feira(
      nome: 'Feira 2',
      endereco: 'RUA FERNAO CARDIM , - CERQUEIRA CESAR',
      dia: 'Quinta-Feira',
      latitude: -23.5690604,
      longitude: -46.6555618,
    ),
    Feira(
      nome: 'Feira 3',
      endereco: 'Rua Chris Tronbjerg - Paraíso, São Paulo - State of São Paulo',
      dia: 'Domingo',
      latitude: -23.5701739,
      longitude: -46.6533109,
    ),
  ];

  List<Feira> get feiras => _feiras;
}
