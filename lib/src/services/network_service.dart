import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../enums/network_status.dart';

abstract class INetworkService {
  Future<NetworkStatus> check();
  void listenConnectivity(void Function(NetworkStatus status) onChange);
  void dispose();
}

class NetworkService extends INetworkService {
  NetworkService() {
    _connectivity = InternetConnection();
  }

  StreamSubscription<InternetStatus>? _subscription;
  late InternetConnection _connectivity;

  @override
  Future<NetworkStatus> check() async {
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
    });
  }
}

