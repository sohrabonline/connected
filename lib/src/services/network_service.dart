import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../enums/network_status.dart';

abstract class INetworkService {
  Future<NetworkStatus> check();

  void listenConnectivity(void Function(NetworkStatus status) onChange);

  void dispose();

  Future<bool> get isConnected;
}

class NetworkService extends INetworkService {
  NetworkService() {
    _connection = InternetConnection.createInstance(
      useDefaultOptions: false,
      checkInterval: const Duration(seconds: 5),
      customCheckOptions: [
        InternetCheckOption(uri: Uri.parse('https://icanhazip.com')),
      ],
    );
  }

  StreamSubscription<InternetStatus>? _subscription;
  late InternetConnection _connection;

  @override
  Future<NetworkStatus> check() async {
    bool result = await _connection.hasInternetAccess;
    return NetworkStatus.fromBool(result);
  }

  @override
  dispose() {
    _subscription?.cancel();
  }

  @override
  void listenConnectivity(void Function(NetworkStatus status) onChange) {
    _subscription = _connection.onStatusChange.listen((InternetStatus result) {
      onChange(NetworkStatus.fromInternetStatusResult(result));
    });
  }

  @override
  Future<bool> get isConnected async => await _connection.hasInternetAccess;
}
