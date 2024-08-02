class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.olamaps.io/places/v1/";

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 30000;
  static const String languageCode = 'en';
  static const String login = 'authentication/authenticate';
}
