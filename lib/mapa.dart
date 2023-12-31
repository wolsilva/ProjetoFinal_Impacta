// ignore_for_file: file_names
// 1ª instalar pacote flutter pub add geolocator

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localizafeira/controllers/feiras_controller.dart';
import 'package:provider/provider.dart';


//final GlobalKey<State<StatefulWidget>> appKey = GlobalKey();
final appKey = GlobalKey();
// ignore: use_key_in_widget_constructors
class Mapa extends StatelessWidget {

//Mapa({super.key});

  //Mapa({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: const Text('Mapa'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<Feiras_controller>(
        create: (context) => Feiras_controller(),
        child: Builder(builder: (context) {
          final local = context.watch<Feiras_controller>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
