import 'package:coachmarker/controller/ola_auto_complete_controller.dart';
import 'package:coachmarker/ola_auto_complete.dart';
import 'package:coachmarker/test_parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'common/dependency_injection.dart';
import 'common/service_locator.dart';
import 'common/utils/storage_service.dart';
import 'common/utils/strings.dart';
import 'routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  setup();
  Get.put(StorageService());
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //HttpOverrides.global = MyHttpOverrides();

  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: OlaAutoComplete()));
}


class MapPage extends StatefulWidget {
  late final double sourceLatittude;

  late final double sourceLongitude;

  late final double destinationLatittude;

  late final double destinationLongitude;

  MapPage(
      {required this.sourceLatittude,
      required this.sourceLongitude,
      required this.destinationLatittude,
      required this.destinationLongitude});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();

  List<LatLng> createCurvedLine(LatLng start, LatLng end) {
    List<LatLng> curvedLine = [];

    // Calculate the midpoint
    double midLat = (start.latitude + end.latitude) / 2;
    double midLng = (start.longitude + end.longitude) / 2;

    double offset = 0.05;
    LatLng controlPoint = LatLng(midLat + offset, midLng);

    int numPoints = 100;
    for (int i = 0; i <= numPoints; i++) {
      double t = i / numPoints;
      double oneMinusT = 1 - t;
      double latitude = oneMinusT * oneMinusT * start.latitude +
          2 * oneMinusT * t * controlPoint.latitude +
          t * t * end.latitude;
      double longitude = oneMinusT * oneMinusT * start.longitude +
          2 * oneMinusT * t * controlPoint.longitude +
          t * t * end.longitude;
      curvedLine.add(LatLng(latitude, longitude));
    }

    return curvedLine;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitBounds();
    });
  }

  void _fitBounds() {
    final bounds = LatLngBounds(
      LatLng(widget.sourceLatittude, widget.sourceLongitude),
      LatLng(widget.destinationLatittude, widget.destinationLongitude),
    );

    _mapController.fitBounds(bounds,
        options: const FitBoundsOptions(padding: EdgeInsets.all(30)));
  }

  @override
  Widget build(BuildContext context) {
    LatLng start = LatLng(widget.sourceLatittude, widget.sourceLongitude);
    LatLng end = LatLng(widget.destinationLatittude, widget.destinationLongitude);
    List<LatLng> curvedPoints = createCurvedLine(start, end);
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(widget.sourceLatittude, widget.sourceLongitude),
          // Coordinates of the map center
          zoom: 6.0,
          maxZoom: 15.0
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            opacity: 0.5,
            userAgentPackageName: 'com.example.app', // Replace with your package name
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(widget.sourceLatittude, widget.sourceLongitude),
                builder: (ctx) => const Icon(Icons.location_on,
                    color: Colors.orange, size: 40.0),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                    widget.destinationLatittude, widget.destinationLongitude),
                builder: (ctx) => const Icon(Icons.not_started,
                    color: Colors.green, size: 40.0),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                  points: [
                    LatLng(widget.sourceLatittude, widget.sourceLongitude),
                    LatLng(widget.destinationLatittude, widget.destinationLongitude)
                  ],
                  strokeWidth: 4.0,
                  color: Colors.black,
                  isDotted: true
              )
            ],
          ),
        ],
      ),
    );
  }
}
