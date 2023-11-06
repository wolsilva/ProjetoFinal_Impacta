import 'dart:convert';
//fonte https://github.com/DevGomes78/Flutter-ViaCep-Api/tree/master
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizafeira/models/cep-models.dart';


class CepProvider extends ChangeNotifier {
  final Cep _cep = Cep();
  String? _bairro;
  String? _endereco;
  String? _localidade;

  String? get bairro => _bairro;

  String? get endereco => _endereco;

  String? get localidade => _localidade;

  Cep get cep => _cep;

  // ignore: non_constant_identifier_names
  void GetCep(String cep) async {
    try {
      final url = Uri.parse('https://viacep.com.br/ws/${cep}/json/');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodeJson = jsonDecode(response.body);
        _bairro = decodeJson['bairro'];
        _endereco = decodeJson['logradouro'];
        _localidade = decodeJson['localidade'];
      } else {
        throw Exception('erro ao acessar a pagina');
      }
      notifyListeners();
    } catch (e) {
      throw Exception('erro ao acessar a pagina');
    }
  }
}