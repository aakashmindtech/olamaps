// To parse this JSON data, do
//
//     final olaAutoCompleteModel = olaAutoCompleteModelFromJson(jsonString);

import 'dart:convert';

OlaAutoCompleteModel olaAutoCompleteModelFromJson(String str) => OlaAutoCompleteModel.fromJson(json.decode(str));

String olaAutoCompleteModelToJson(OlaAutoCompleteModel data) => json.encode(data.toJson());

class OlaAutoCompleteModel {
  String errorMessage;
  List<dynamic> infoMessages;
  List<Prediction> predictions;
  String status;

  OlaAutoCompleteModel({
    required this.errorMessage,
    required this.infoMessages,
    required this.predictions,
    required this.status,
  });

  factory OlaAutoCompleteModel.fromJson(Map<String, dynamic> json) => OlaAutoCompleteModel(
    errorMessage: json["error_message"],
    infoMessages: List<dynamic>.from(json["info_messages"].map((x) => x)),
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "error_message": errorMessage,
    "info_messages": List<dynamic>.from(infoMessages.map((x) => x)),
    "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
    "status": status,
  };
}

class Prediction {
  String reference;
  List<String> types;
  List<MatchedSubstring> matchedSubstrings;
  List<Term> terms;
  StructuredFormatting structuredFormatting;
  String description;
  Geometry geometry;
  String placeId;
  List<String> layer;

  Prediction({
    required this.reference,
    required this.types,
    required this.matchedSubstrings,
    required this.terms,
    required this.structuredFormatting,
    required this.description,
    required this.geometry,
    required this.placeId,
    required this.layer,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    reference: json["reference"],
    types: List<String>.from(json["types"].map((x) => x)),
    matchedSubstrings: List<MatchedSubstring>.from(json["matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
    structuredFormatting: StructuredFormatting.fromJson(json["structured_formatting"]),
    description: json["description"],
    geometry: Geometry.fromJson(json["geometry"]),
    placeId: json["place_id"],
    layer: List<String>.from(json["layer"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "reference": reference,
    "types": List<dynamic>.from(types.map((x) => x)),
    "matched_substrings": List<dynamic>.from(matchedSubstrings.map((x) => x.toJson())),
    "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
    "structured_formatting": structuredFormatting.toJson(),
    "description": description,
    "geometry": geometry.toJson(),
    "place_id": placeId,
    "layer": List<dynamic>.from(layer.map((x) => x)),
  };
}

class Geometry {
  Location location;

  Geometry({
    required this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
  };
}

class Location {
  double lng;
  double lat;

  Location({
    required this.lng,
    required this.lat,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lng: json["lng"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lng": lng,
    "lat": lat,
  };
}

class MatchedSubstring {
  int offset;
  int length;

  MatchedSubstring({
    required this.offset,
    required this.length,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
    offset: json["offset"],
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "length": length,
  };
}

class StructuredFormatting {
  List<MatchedSubstring> mainTextMatchedSubstrings;
  List<MatchedSubstring> secondaryTextMatchedSubstrings;
  String secondaryText;
  String mainText;

  StructuredFormatting({
    required this.mainTextMatchedSubstrings,
    required this.secondaryTextMatchedSubstrings,
    required this.secondaryText,
    required this.mainText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => StructuredFormatting(
    mainTextMatchedSubstrings: List<MatchedSubstring>.from(json["main_text_matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    secondaryTextMatchedSubstrings: List<MatchedSubstring>.from(json["secondary_text_matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    secondaryText: json["secondary_text"],
    mainText: json["main_text"],
  );

  Map<String, dynamic> toJson() => {
    "main_text_matched_substrings": List<dynamic>.from(mainTextMatchedSubstrings.map((x) => x.toJson())),
    "secondary_text_matched_substrings": List<dynamic>.from(secondaryTextMatchedSubstrings.map((x) => x.toJson())),
    "secondary_text": secondaryText,
    "main_text": mainText,
  };
}

class Term {
  int offset;
  String value;

  Term({
    required this.offset,
    required this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
    offset: json["offset"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "value": value,
  };
}
