import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class CarlertMap extends StatefulWidget {
  const CarlertMap({Key? key}) : super(key: key);

  @override
  _CarlertMapState createState() => _CarlertMapState();
}

class _CarlertMapState extends State<CarlertMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  var _mapStyle = "";

   BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;

  List<Marker> allMarkers = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 0, //192.8334901395799,
      target: LatLng(25.197525, 55.274288),
      tilt: 0, //59.440717697143555,
      zoom: 16.151926040649414);

  @override
  void initState() {
    addCustomIcon();
    super.initState();
    rootBundle.loadString("assets/map/map_style.json").then((value) {
      // debugPrint("Map style -> $value");
      _mapStyle = value;
    }).catchError((e) {
      debugPrint("Map style -> $e");
    });




  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      compassEnabled: true,
      mapToolbarEnabled: false,
      initialCameraPosition: _kLake,
      markers: Set.from(allMarkers),
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          controller.setMapStyle(_mapStyle);
        });
        _controller.complete(controller);

        controller.animateCamera(
            CameraUpdate.newLatLngZoom(const LatLng(24.870012, 55.07278), 17));


        setState(() {
          allMarkers.add(Marker(
            icon: _markerIcon,
            infoWindow: const InfoWindow(title: "Service My Car", snippet: "Your office location in DIC dubai, UAE"),
            markerId: const MarkerId('Service My Car'),
            position: const LatLng(24.870012, 55.07278),
          ));
        });



      },
    );
  }

  void addCustomIcon(){
    getMarkerIcon("assets/images/car_marker.png").then((icon){
      setState(() {
        _markerIcon = icon;
      });
    }).catchError((e){
      debugPrint("addCustomIcon: error -> $e");
    });
  }


  Future<BitmapDescriptor> getMarkerIcon(String assetPath) async {

  final ByteData markerIcon = await  rootBundle.load(assetPath);

 //return BitmapDescriptor.fromBytes(markerIcon.buffer.asUint8List(),size: const Size(24, 24));

   return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(24, 24,)),
     //ImageConfiguration.empty,
        assetPath);
  }

}

