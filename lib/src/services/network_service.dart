import 'dart:async';
import 'package:connected/src/configs/config.dart';

import '../enums/network_status.dart';
import '../internet_checker/internet_check_option.dart';
import '../internet_checker/internet_connection.dart';
import '../internet_checker/internet_status.dart';

abstract class INetworkService {
  Future<NetworkStatus> check();

  void listenConnectivity(void Function(NetworkStatus status) onChange);

  void dispose();

  Future<bool> get isConnected;
}

class NetworkService extends INetworkService {
  NetworkService({this.timeOut, this.checkInterval}) {
    print("timeOut:   $timeOut");
    print("checkInterval:   $checkInterval");
    _connection = InternetConnection.createInstance(
      useDefaultOptions: false,
      checkInterval: checkInterval ??
          const Duration(seconds: Configs.defaultCheckInterval),
      customCheckOptions: [
        InternetCheckOption(
            uri: Uri.parse('https://icanhazip.com'), timeout: timeOut)
      ],
    );
  }

  StreamSubscription<InternetStatus>? _subscription;
  late InternetConnection? _connection;
  Duration? timeOut;
  Duration? checkInterval;

  @override
  Future<NetworkStatus> check() async {
    bool result = await _connection!.hasInternetAccess;
    return NetworkStatus.fromBool(result);
  }

  @override
  dispose() {
    _subscription?.cancel();
  }

  @override
  void listenConnectivity(void Function(NetworkStatus status) onChange) {
    _subscription = _connection!.onStatusChange.listen((InternetStatus result) {
      onChange(NetworkStatus.fromInternetStatusResult(result));
    });
  }

  @override
  Future<bool> get isConnected async => await _connection!.hasInternetAccess;
}
