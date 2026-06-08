class AppConfig {
  static const String appName = 'My Flutter App';
  static const String version = '1.0.0';
String get baseApiUrl => 'https://tlu-students.onrender.com';
String get baseSocketUrl => baseApiUrl;
  String get baseModuleApiUrl => 'https://module.example.com/api';
  String get baseWebSocketUrl => 'wss://ws.example.com';
  
  static const double defaultLatitude = 20.97637;
  static const double defaultLongitude = 105.81559;
  static const double defaultAllowedRadius = 1000.0; // in meters
  // Add more configuration constants as needed
}