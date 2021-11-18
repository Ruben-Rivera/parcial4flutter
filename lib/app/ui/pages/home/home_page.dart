import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  List<Marker> markers = [];
  Map<MarkerId, Marker> _makers = Map();

  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.5327821, -88.2561504), zoom: 9);

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker primero = Marker(
      markerId: MarkerId('Usulutan'),
      position: LatLng(13.4196531, -88.5087407),
      infoWindow: InfoWindow(
          title: 'Sucursal de Telovello SV en Usulután',
          snippet: 'Sera un placer atenderle estimado cliente.'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    );
    Marker segundo = Marker(
      markerId: MarkerId('San Miguel'),
      position: LatLng(13.4758851, -88.1798631),
      infoWindow: InfoWindow(
          title: 'Sucursal de Telovello SV en San Miguel',
          snippet: 'Sera un placer atenderle estimado cliente.'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker tercero = Marker(
      markerId: MarkerId('Morazan'),
      position: LatLng(13.7532409, -88.1072416),
      infoWindow: InfoWindow(
        title: 'Sucursal de Telovello SV en Morazán',
        snippet: 'Sera un placer atenderle estimado cliente.',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );
    Marker cuarto = Marker(
      markerId: MarkerId('La Unión'),
      position: LatLng(13.5004286, -87.9006871),
      infoWindow: InfoWindow(
        title: 'Sucursal de Telovello SV en La Unión',
        snippet: 'Sera un placer atenderle estimado cliente',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    markers.add(primero);
    markers.add(segundo);
    markers.add(tercero);
    markers.add(cuarto);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        compassEnabled: false,
        markers: markers.map((e) => e).toSet(),
      ),
    );
  }
}
