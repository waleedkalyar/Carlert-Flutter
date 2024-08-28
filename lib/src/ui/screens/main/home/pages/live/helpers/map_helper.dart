// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/
import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:ui';


import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/carlert_marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_cluster_manager_2/src/cluster_manager.dart' as cluster_manager_2;
import 'package:google_maps_cluster_manager_2/src/cluster.dart' as cluster_manager_2;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static Future<CarlertMarker> Function(cluster_manager_2.Cluster) get markerBuilder => (cluster) async {
        return CarlertMarker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            log(cluster.items.toString());
          },
          icon: await getClusterBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : ""),
        );
      };





  static Future<BitmapDescriptor> getMarkerBitmap(int size, double size2, int typeZeroLength, int typeOneLength, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = const Color(0xFF4051B5);
    final Paint paint2 = Paint()..color = Colors.white;
    final Paint paint3 = Paint()..color = Colors.red;

    double degreesToRads(num deg) {
      return (deg * 3.14) / 180.0;
    }

    int total = typeZeroLength + typeOneLength;
    var totalRatio = 2.09439666667 * 3;
    double percentageOfLength = (typeZeroLength / total);
    var resultRatio = totalRatio * percentageOfLength;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.8, paint3);
    canvas.drawArc(const Offset(0, 0) & Size(size2, size2), degreesToRads(90.0), resultRatio, true, paint3);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.2, paint2);
    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(fontSize: size / 3, color: Colors.black, fontWeight: FontWeight.normal),
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

  static Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
      BuildContext context,
      String assetName,
      double size,
      ) async {
    String svgString = await DefaultAssetBundle.of(context).loadString(assetName);
    var svgDrawableRoot = await vg.loadPicture(SvgStringLoader(svgString), null);
    ui.Picture picture = svgDrawableRoot.picture;//svgDrawableRoot.toPicture(size: Size(size, size));
    ui.Image image = await picture.toImage(size.toInt(), size.toInt());
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }


  static Future<BitmapDescriptor> getClusterBitmap(int size,
      {required String text}) async {
    final ui.PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.red;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);

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

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}
