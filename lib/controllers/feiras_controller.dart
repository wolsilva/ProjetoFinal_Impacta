// ignore: file_names
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizafeira/repositories/feiras_repository.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Feiras_controller extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = <Marker>{};
  late GoogleMapController _mapsController;

  // ignore: non_constant_identifier_names
  /*Feiras_controller() {
    getPosicao();
  }*/

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadFeiras();
  }

  loadFeiras() {
    final feiras = FeirasRepository().feiras;
    // ignore: avoid_function_literals_in_foreach_calls
    feiras.forEach((feira) async {
      markers.add(
        Marker(
          markerId: MarkerId(feira.nome),
          position: LatLng(feira.latitude, feira.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            'feira.jpeg',
          ),
          onTap: () => {},
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error(
          'Por favor, habilite a sua localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }
    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }
    return await Geolocator.getCurrentPosition();
  }
}
