import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class INetworkService {
  Future<NetworkStatus> checkNetwork();

  void listenConnectivity(void Function(NetworkStatus status) onChange);

  void dispose();
}

class NetworkService extends INetworkService {
  NetworkService() {
    _connectivity = InternetConnection();
  }

//  StreamSubscription<ConnectivityResult>? _subscription;
  StreamSubscription<InternetStatus>? _subscription;
  late InternetConnection _connectivity;

  @override
  Future<NetworkStatus> checkNetwork() async {
    //final result = await (_connectivity.checkConnectivity());
    // return NetworkStatus.fromConnectivityResult(result);
    bool result = await InternetConnection().hasInternetAccess;
    return NetworkStatus.fromBool(result);
  }

  @override
  dispose() {
    _subscription?.cancel();
  }

  @override
  void listenConnectivity(void Function(NetworkStatus status) onChange) {
    _subscription =
        _connectivity.onStatusChange.listen((InternetStatus result) {
      onChange(NetworkStatus.fromInternetStatusResult(result));

      // Got a new connectivity status!
    });
  }
}

enum NetworkStatus {
  on,
  off;

  // static NetworkStatus fromConnectivityResult(ConnectivityResult result) {
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //     case ConnectivityResult.mobile:
  //     case ConnectivityResult.bluetooth:
  //     case ConnectivityResult.ethernet:
  //     case ConnectivityResult.other:
  //     case ConnectivityResult.vpn:
  //       return NetworkStatus.on;
  //     case ConnectivityResult.none:
  //       return NetworkStatus.off;
  //   }
  // }

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
