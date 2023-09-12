import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum NetworkStatus {
  on,
  off;

  static NetworkStatus fromInternetStatusResult(InternetStatus result) {
    switch (result) {
      case InternetStatus.connected:
        // The internet is now connected
        return NetworkStatus.on;
      case InternetStatus.disconnected:
        // The internet is now disconnected
        return NetworkStatus.off;
    }
  }

  static NetworkStatus fromBool(bool result) {
    switch (result) {
      case true:
        return NetworkStatus.on;
      case false:
        return NetworkStatus.off;
    }
  }
}
