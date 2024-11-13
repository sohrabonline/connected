import '../internet_checker/internet_status.dart';

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
