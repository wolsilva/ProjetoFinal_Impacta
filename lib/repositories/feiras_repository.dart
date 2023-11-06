import 'package:flutter/material.dart';
import 'package:localizafeira/models/feira.dart';

class FeirasRepository extends ChangeNotifier {
  final List<Feira> _feiras = [
    Feira(
      nome: 'Feira Rua Batataes',
      endereco: 'R. Batataes, 83 - Jardim Paulista',
      dia: 'Quarta-Feira',
      latitude: -23.5726747,
      longitude: -46.6588478,
    ),
    Feira(
      nome: 'Feira R. Cap. Pinto Ferreira',
      endereco: 'R. Cap. Pinto Ferreira, 38 - Jardim Paulista',
      dia: 'Quarta-Feira',
      latitude: -23.5720329,
      longitude: -46.6572872,
    ),
    Feira(
      nome: 'Feira Rua Fernao Cardim',
      endereco: 'RUA FERNAO CARDIM , - CERQUEIRA CESAR',
      dia: 'Quinta-Feira',
      latitude: -23.5690604,
      longitude: -46.6555618,
    ),
    Feira(
      nome: 'Feira Rua Chris Tronbjerg',
      endereco: 'Rua Chris Tronbjerg - Paraíso, São Paulo - State of São Paulo',
      dia: 'Domingo',
      latitude: -23.5701739,
      longitude: -46.6533109,
    ),
    Feira(
      nome: 'Feira Rua Guarara',
      endereco:
          'Feira Rua Guarara, 108 - Jardim Paulista, São Paulo - SP, 01401-001',
      dia: 'Domingo',
      latitude: -23.5737128,
      longitude: -46.6575025,
    ),
  ];

  List<Feira> get feiras => _feiras;
}
