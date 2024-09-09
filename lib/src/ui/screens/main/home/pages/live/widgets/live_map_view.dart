// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/carlert_marker.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/widgets/marker_view.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/utils/lat_lng_tween.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_cluster_manager_2/src/cluster_manager.dart'
    as cluster_manager_2;
import 'package:google_maps_cluster_manager_2/src/cluster.dart'
    as cluster_manager_2;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../bloc/live_markers_bloc.dart';

//Setting dummies values
const kStartPosition = LatLng(24.85474, 55.079298);
const kSantoDomingo = CameraPosition(target: kStartPosition, zoom: 15);
const kMarkerId = MarkerId('MarkerId1');

class LiveMapView extends StatefulWidget {
  const LiveMapView({super.key});

  @override
  State<LiveMapView> createState() => _LiveMapViewState();
}

class _LiveMapViewState extends State<LiveMapView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  Map<MarkerId, CarlertMarker> markers = {};
  final controller = Completer<GoogleMapController>();

  //var _mapStyle = "";

  BitmapDescriptor inactiveIcon = BitmapDescriptor.defaultMarker;

  late cluster_manager_2.ClusterManager _clusterManager;

  Set<CarlertMarker> clusterMarkers = Set();

  StreamSubscription<LatLng>? dataSubscription;

  late LiveMarkersBloc liveMarkersBloc;

  bool isUpdatingMarkers = false;

  bool satelliteEnabled = false,
      plateEnabled = true,
      fleetEnabled = false,
      trafficEnabled = false;

  @override
  void initState() {
    _clusterManager = _initClusterManager();
    // rootBundle.loadString("assets/map/map_style.json").then((value) {
    //   _mapStyle = value;
    // }).catchError((e) {
    //   debugPrint("Map style -> $e");
    // });

    if (inactiveIcon == BitmapDescriptor.defaultMarker) {
      const MarkerView(
        text: "test",
      ).toBitmapDescriptor().then((icon) {
        // log("inactive icon from svg fetched");
        inactiveIcon = icon;
      });
    }

    markers.clear();

    liveMarkersBloc = context.read<LiveMarkersBloc>();

    liveMarkersBloc.add(const SubscribeToVehiclesEvent("all-veh-location"));

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  cluster_manager_2.ClusterManager _initClusterManager() {
    return cluster_manager_2.ClusterManager<CarlertMarker>(
        markers.values.toSet(), _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    // log('ClusterManager: updateMarkers: Updated ${markers.length} markers');
    Set<CarlertMarker> carlertMarkers = {};
    for (var marker in markers) {
      //  log("ClusterManager: marker id -> ${marker.markerId.value}");
      if (marker.markerId.value.contains("-")) {
        var ids = marker.markerId.value.split("-");
        for (var id in ids) {
          carlertMarkers.removeWhere((marker) => marker.markerId.value == id);
        }
      }
      carlertMarkers.add(marker.toCarlertMarker());
    }
    // setState(() {
    clusterMarkers = carlertMarkers;
    //  });
  }

  @override
  Widget build(BuildContext context) {
    // print("On map created build");
    // log("On map created build");
    return Stack(
      children: [
        BlocListener<LiveMarkersBloc, LiveMarkersState>(
          listener: (context, state) {
            if (state is VehiclesChannelConnectedState) {
              var chip = state.data;

              if (!isUpdatingMarkers) {
                onLocationUpdate(
                    LatLng(double.parse(chip.lat ?? "0"),
                        double.parse(chip.longi ?? "0")),
                    MarkerId(chip.deviceID.toString()),
                    chip.fleetNo.toString(),
                    chip.plateCode != null
                        ? "${chip.plateCode} - ${chip.plateNumber.toString()}"
                        : chip.plateNumber.toString(),
                    chip.isActive == 1);
              }
            }
          },
          child: Animarker(
            shouldAnimateCamera: false,
            useRotation: false,
            rippleRadius: 0.0,
            rippleDuration: const Duration(milliseconds: 0),
            rippleColor: appGreen,
            markers: markers.values.toSet(),
            mapId: controller.future.then<int>((value) => value.mapId),
            child: GoogleMap(
                mapType: satelliteEnabled ? MapType.satellite : MapType.normal,
                zoomControlsEnabled: false,
                rotateGesturesEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                trafficEnabled: trafficEnabled,
               // style: _mapStyle,
                initialCameraPosition: kSantoDomingo,
                onMapCreated: (gController) {
                  //  log("On map created");
                  //  loadJsonFromAssets("assets/map/trip.json", "m1");
                  // Future.delayed(const Duration(seconds: 10), () {
                  //   loadJsonFromAssets("assets/map/trip.json", "m2");
                  // });
                  // Future.delayed(Duration(seconds: 15), () {
                  //   loadJsonFromAssets("assets/map/trip.json", "m3");
                  // });
                  // Future.delayed(Duration(seconds: 5), () {
                  //   loadJsonFromAssets("assets/map/trip.json", "m4");
                  // });
                  controller.complete(gController);

                //  _clusterManager.setMapId(gController.mapId);

                  //Complete the future GoogleMapController
                },
               // onCameraMove: _clusterManager.onCameraMove,
               // onCameraIdle: _clusterManager.updateMap

            ),
          ),
        ),
        Positioned(
            right: 16,
            top: 156,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      satelliteEnabled = !satelliteEnabled;
                    });
                  },
                  icon: ImageIcon(
                    AssetImage(satelliteEnabled
                        ? Assets.imagesImgIconNoSatellite
                        : Assets.imagesImgIconSatellite),
                    size: 24,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fixedSize: const Size(47, 47),
                      elevation: 2,
                      alignment: Alignment.center),
                ),
                16.height,
                IconButton(
                  onPressed: () {
                    plateEnabled = !plateEnabled;
                    if (plateEnabled) fleetEnabled = false;
                    refreshMarkers();
                    //setMapCameraInMarkersBound();
                  },
                  icon: ImageIcon(
                    AssetImage(plateEnabled
                        ? Assets.imagesImgIconNoLicensePlate
                        : Assets.imagesImgIconLicensePlate),
                    size: 24,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fixedSize: const Size(47, 47),
                      elevation: 2,
                      alignment: Alignment.center),
                ),
                16.height,
                IconButton(
                  onPressed: () {
                    fleetEnabled = !fleetEnabled;
                    if (fleetEnabled) plateEnabled = false;
                    refreshMarkers();
                    // setMapCameraInMarkersBound();
                  },
                  icon: ImageIcon(
                    AssetImage(
                      fleetEnabled
                          ? Assets.imagesImgIcFleetDisabled
                          : Assets.imagesImgIcFleet,
                    ),
                    size: 24,
                    color: null,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fixedSize: const Size(47, 47),
                      elevation: 2,
                      alignment: Alignment.center),
                ),
                16.height,
                IconButton(
                  onPressed: () {
                    setState(() {
                      trafficEnabled = !trafficEnabled;
                    });
                  },
                  icon: ImageIcon(
                    AssetImage(trafficEnabled
                        ? Assets.imagesIcImgTrafficLightDisabled
                        : Assets.imagesIcImgTrafficLight),
                    size: 24,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      fixedSize: const Size(47, 47),
                      elevation: 2,
                      alignment: Alignment.center),
                ),
              ],
            )),
      ],
    );
  }

  void newLocationUpdate(
      LatLng latLng, MarkerId markerId, String fleetNo, String plateNo) {
    // debugPrint("newLocationUpdate called with id -> ${markerId.value}");
    var marker = CarlertMarker(
        markerId: markerId,
        position: latLng,
        ripple: false,
        draggable: false,
        icon: inactiveIcon,
        infoWindow: InfoWindow(title: markerId.value),
        fleetNo: fleetNo,
        plateNo: plateNo,
        onTap: () {
          if (kDebugMode) {
            print('Tapped! $latLng');
          }
        });
    //marker.setMapId(markerId.value);
    if (markers.containsKey(markerId)) {
      //locationUpdateWithAnimation(latLng, markers[markerId]!);
      // setState(() {
      markers[markerId] = marker;
      _clusterManager.setItems(markers.values.toList());
      // });
    } else if (0 == 1) {
      //markers.containsKey(markerId)
      //TODO: here need to setup animation code
      const delta = 2;
      var current = markers[markerId]!.position;
      var deltaLat = (latLng.latitude - current.latitude) / delta;
      var deltaLng = (latLng.longitude - current.longitude) / delta;

      var currentLat = current.latitude;
      var currentLang = current.longitude;
      for (int i = 0; i < delta; i++) {
        currentLat += deltaLat;
        currentLang += deltaLng;
        var pos = LatLng(currentLat, currentLang);
        marker.copyWith(positionParam: pos);
        setState(() {
          markers[markerId] = marker;
          _clusterManager.setItems(markers.values.toList());
        });
      }
    } else {
      if (mounted) {
        setState(() {
          markers[markerId] = marker;
          _clusterManager.setItems(markers.values.toList());
        });
      }
    }
  }

  void onLocationUpdate(LatLng latLng, MarkerId markerId, String fleetNo,
      String plateNo, bool isActive) {
    if (markers.containsKey(markerId)) {
      var marker = CarlertMarker(
          markerId: markerId,
          position: latLng,
          ripple: false,
          draggable: false,
          isActive: isActive,
          icon: markers[markerId]?.icon,
          infoWindow: InfoWindow.noText,
          fleetNo: fleetNo,
          plateNo: plateNo,
          onTap: () {
            if (kDebugMode) {
              print('Tapped! $latLng');
            }
          });
      setState(() {
        markers[markerId] = marker;
        //_clusterManager.setItems(markers.values.toList());
      });
    } else {
      MarkerView(
        text: textOnMarker(fleetNo, plateNo),
        active: isActive,
      ).toBitmapDescriptor().then((icon) {
        var marker = CarlertMarker(
            markerId: markerId,
            position: latLng,
            ripple: false,
            draggable: false,
            isActive: isActive,
            icon: icon,
            infoWindow: InfoWindow.noText,
            fleetNo: fleetNo,
            plateNo: plateNo,
            onTap: () {
              if (kDebugMode) {
                print('Tapped! $latLng');
              }
            });
        setState(() {
          markers[markerId] = marker;
        });
      });
    }
  }

  void locationUpdateWithAnimation(LatLng latLng, CarlertMarker marker) {
    AnimationController controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Tween<LatLng> tween = LatLngTween(begin: marker.location, end: latLng);
    Animation<LatLng> animation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.forward().then((value) async {
      setState(() {
        markers[marker.markerId] = marker.update(animation.value);
        _clusterManager.setItems(markers.values.toList());
      });
    });
  }

  void refreshMarkers() {
    // markers.forEach((id, marker) {
    //   onLocationUpdate(marker.location, id, marker.fleetNo, marker.plateNo, marker.isActive);
    // });
    setState(() {
      isUpdatingMarkers = true;
    });

    markers.forEach((id, marker) async {
      var updatedIcon = await MarkerView(
        text: textOnMarker(marker.fleetNo, marker.plateNo),
        active: marker.isActive,
      ).toBitmapDescriptor();

      var newMarker = CarlertMarker(
          markerId: marker.markerId,
          position: marker.position,
          ripple: false,
          draggable: false,
          isActive: marker.isActive,
          icon: updatedIcon,
          infoWindow: InfoWindow.noText,
          fleetNo: marker.fleetNo,
          plateNo: marker.plateNo,
          onTap: () {
            if (kDebugMode) {
              // print('Tapped! $latLng');
            }
          });
      if (markers.containsKey(id)) {
        setState(() {
          markers[id] = newMarker;
        });
      }
    });

    setState(() {
      isUpdatingMarkers = false;
    });

    // setState(() {});

    //_clusterManager.setItems(markers.values.toList());
  }

  void setMapCameraInMarkersBound() {
    controller.future.then((mapController) {
      List<LatLng> lats =
          markers.values.map((marker) => marker.position).toList();
      mapController
          .moveCamera(CameraUpdate.newLatLngBounds(lats.computeBounds(), 36));
    });
  }

  @override
  void dispose() {
    markers.clear();
    // _clusterManager.setItems([]);
    dataSubscription?.cancel();
    liveMarkersBloc.add(const UnsubscribeToVehiclesEvent("all-veh-location"));

    super.dispose();
  }

  void loadJsonFromAssets(String filePath, String markerId) {
    List<LatLng> trip = [];
    // log("TripData : loadJsonFromAssets() ");
    rootBundle.loadString(filePath).then((value) {
      //log("TripData : String data -> $value ");
      var jsonTrip = jsonDecode(value) as List<dynamic>;
      for (var modelValue in jsonTrip) {
        var model = modelValue as Map<String, dynamic>;
        // log("TripData : lat -> ${model["lat"]}, lng -> ${model["lng"]}");
        trip.add(LatLng(model["lat"], model["lng"]));
      }

      var stream = Stream.periodic(
              const Duration(milliseconds: 700), (count) => trip[count])
          .take(130); //trip.length

      dataSubscription = stream.listen((latLang) {
        newLocationUpdate(
            latLang, MarkerId(markerId), "test fleet", "test plate");
        // locationUpdateWithAnimation(latLang, MarkerId(markerId));
      });

      // stream.forEach((value) {
      //   newLocationUpdate(value, MarkerId(markerId));
      // });
      // Future.delayed(const Duration(seconds: 5),(){
      // stream.forEach((value) => newLocationUpdate(value, const MarkerId("m2")));
      // });
    }).catchError((e) {
      // log("TripData : error ${e.toString()}");
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {}
    if (state == AppLifecycleState.resumed) {}
  }

  Future<Marker> Function(cluster_manager_2.Cluster<CarlertMarker>)
      get _markerBuilder => (cluster) async {
            var markerIdValue = "";
            cluster.items.forEach((marker) {
              markerIdValue += "${marker.markerId.value}-";
            });
            markerIdValue =
                markerIdValue.substring(0, markerIdValue.length - 1);
            //  log("ClusterBuilder: marker id value is -> $markerIdValue");
            return Marker(
              markerId: MarkerId(cluster.getId()),
              infoWindow: InfoWindow(title: markerIdValue),
              position: cluster.location,
              onTap: () {
                //   log('---- $cluster');
                for (var p in cluster.items) {
                  print(p);
                }
              },
              icon: await _getMarkerBitmap(
                  cluster.isMultiple, cluster.isMultiple ? 125 : 75,
                  text: cluster.isMultiple
                      ? cluster.count.toString()
                      : plateEnabled
                          ? cluster.items.first.plateNo
                          : fleetEnabled
                              ? cluster.items.first.fleetNo
                              : null),
            );
          };

  Future<BitmapDescriptor> _getMarkerBitmap(bool isMultiple, int size,
      {String? text}) async {
    if (isMultiple) {
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
      final data =
          await img.toByteData(format: ImageByteFormat.png) as ByteData;

      return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
    } else {
      return await MarkerView(
        text: text ?? "",
      ).toBitmapDescriptor();
    }
  }

  void moveMarker(CarlertMarker carlertMarker, LatLng newPosition) {
    int numDeltas = 50; //number of delta to devide total distance
    int delay = 50; //milliseconds of delay to pass each delta
    var i = 0;
    double? deltaLat;
    double? deltaLng;
    var position = carlertMarker.position;

    for (i = 0; i < numDeltas; i++) {
      deltaLat = (newPosition.latitude - position.latitude) / numDeltas;
      deltaLng = (newPosition.longitude - position.longitude) / numDeltas;
      // Future.delayed(Duration(milliseconds: delay), () {
      setState(() {
        carlertMarker.update(LatLng(deltaLat!, deltaLng!));
      });
      //});
    }
  }

  String textOnMarker(String fleetNo, String plateNo) {
    if (!fleetEnabled && !plateEnabled) {
      return "";
    } else if (fleetEnabled)
      return fleetNo;
    else if (plateEnabled)
      return plateNo;
    else
      return "";
  }
}
