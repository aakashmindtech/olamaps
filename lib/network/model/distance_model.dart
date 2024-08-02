// To parse this JSON data, do
//
//     final distanceModel = distanceModelFromJson(jsonString);

import 'dart:convert';

DistanceModel distanceModelFromJson(String str) => DistanceModel.fromJson(json.decode(str));

String distanceModelToJson(DistanceModel data) => json.encode(data.toJson());

class DistanceModel {
  String status;
  List<GeocodedWaypoint> geocodedWaypoints;
  List<Route> routes;
  String sourceFrom;

  DistanceModel({
    required this.status,
    required this.geocodedWaypoints,
    required this.routes,
    required this.sourceFrom,
  });

  factory DistanceModel.fromJson(Map<String, dynamic> json) => DistanceModel(
    status: json["status"],
    geocodedWaypoints: List<GeocodedWaypoint>.from(json["geocoded_waypoints"].map((x) => GeocodedWaypoint.fromJson(x))),
    routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
    sourceFrom: json["source_from"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "geocoded_waypoints": List<dynamic>.from(geocodedWaypoints.map((x) => x.toJson())),
    "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
    "source_from": sourceFrom,
  };
}

class GeocodedWaypoint {
  String geocoderStatus;
  String placeId;
  List<dynamic> types;

  GeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) => GeocodedWaypoint(
    geocoderStatus: json["geocoder_status"],
    placeId: json["place_id"],
    types: List<dynamic>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "geocoder_status": geocoderStatus,
    "place_id": placeId,
    "types": List<dynamic>.from(types.map((x) => x)),
  };
}

class Route {
  String summary;
  List<Leg> legs;
  String overviewPolyline;
  String travelAdvisory;
  Bounds bounds;
  String copyrights;
  List<dynamic> warnings;

  Route({
    required this.summary,
    required this.legs,
    required this.overviewPolyline,
    required this.travelAdvisory,
    required this.bounds,
    required this.copyrights,
    required this.warnings,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    summary: json["summary"],
    legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
    overviewPolyline: json["overview_polyline"],
    travelAdvisory: json["travel_advisory"],
    bounds: Bounds.fromJson(json["bounds"]),
    copyrights: json["copyrights"],
    warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
    "overview_polyline": overviewPolyline,
    "travel_advisory": travelAdvisory,
    "bounds": bounds.toJson(),
    "copyrights": copyrights,
    "warnings": List<dynamic>.from(warnings.map((x) => x)),
  };
}

class Bounds {
  Bounds();

  factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Leg {
  List<Step> steps;
  int distance;
  String readableDistance;
  int duration;
  String readableDuration;
  Location startLocation;
  Location endLocation;
  String startAddress;
  String endAddress;

  Leg({
    required this.steps,
    required this.distance,
    required this.readableDistance,
    required this.duration,
    required this.readableDuration,
    required this.startLocation,
    required this.endLocation,
    required this.startAddress,
    required this.endAddress,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    distance: json["distance"],
    readableDistance: json["readable_distance"],
    duration: json["duration"],
    readableDuration: json["readable_duration"],
    startLocation: Location.fromJson(json["start_location"]),
    endLocation: Location.fromJson(json["end_location"]),
    startAddress: json["start_address"],
    endAddress: json["end_address"],
  );

  Map<String, dynamic> toJson() => {
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
    "distance": distance,
    "readable_distance": readableDistance,
    "duration": duration,
    "readable_duration": readableDuration,
    "start_location": startLocation.toJson(),
    "end_location": endLocation.toJson(),
    "start_address": startAddress,
    "end_address": endAddress,
  };
}

class Location {
  double lat;
  double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Step {
  String instructions;
  int distance;
  String readableDistance;
  String maneuver;
  int duration;
  String readableDuration;
  Location startLocation;
  Location endLocation;
  int bearingBefore;
  int bearingAfter;

  Step({
    required this.instructions,
    required this.distance,
    required this.readableDistance,
    required this.maneuver,
    required this.duration,
    required this.readableDuration,
    required this.startLocation,
    required this.endLocation,
    required this.bearingBefore,
    required this.bearingAfter,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    instructions: json["instructions"],
    distance: json["distance"],
    readableDistance: json["readable_distance"],
    maneuver: json["maneuver"],
    duration: json["duration"],
    readableDuration: json["readable_duration"],
    startLocation: Location.fromJson(json["start_location"]),
    endLocation: Location.fromJson(json["end_location"]),
    bearingBefore: json["bearing_before"],
    bearingAfter: json["bearing_after"],
  );

  Map<String, dynamic> toJson() => {
    "instructions": instructions,
    "distance": distance,
    "readable_distance": readableDistance,
    "maneuver": maneuver,
    "duration": duration,
    "readable_duration": readableDuration,
    "start_location": startLocation.toJson(),
    "end_location": endLocation.toJson(),
    "bearing_before": bearingBefore,
    "bearing_after": bearingAfter,
  };
}
