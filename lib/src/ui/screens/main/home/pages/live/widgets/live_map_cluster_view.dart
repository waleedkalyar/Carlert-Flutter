// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class LiveMapClusterView extends StatefulWidget {
  const LiveMapClusterView({super.key});

  @override
  State<LiveMapClusterView> createState() => _LiveMapClusterViewState();
}

class _LiveMapClusterViewState extends State<LiveMapClusterView> {
  late ClusterManager _manager;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  final CameraPosition _parisCameraPosition =
  CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          isClosed: i % 2 == 0,
          latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(66.160507 + i * 0.1, -153.369141 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(-36.848461 + i * 1, 169.763336 + i * 1)),
  ];

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }




  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _parisCameraPosition,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _manager.setMapId(controller.mapId);
        },
        onCameraMove: _manager.onCameraMove,
        onCameraIdle: _manager.updateMap
    );
  }



  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
          (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }


}
