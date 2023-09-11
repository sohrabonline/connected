import 'package:flutter/material.dart';
import '../mixins/state_mixin.dart';
import '../services/network_service.dart';

mixin NetworkStatusListenableBoxMixin<
        _NetworkStatusViewState extends StatefulWidget>
    on State<_NetworkStatusViewState>, StateMixin<_NetworkStatusViewState> {
  late INetworkService networkService;
  NetworkStatus networkStatus = NetworkStatus.on;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkService = NetworkService();
    onWidgetCompleted(() {
      checkWhenStartUP();
      startListener();
    });
  }

  void checkWhenStartUP() async {
    onWidgetCompleted(() async {
      final status = await networkService.checkNetwork();
      updateViewState(status);
    });
  }

  void startListener() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      networkService.listenConnectivity((status) => updateViewState(status));
    });
  }

  void updateViewState(NetworkStatus networkStatus) {
    networkStatus = networkStatus;
    setState(() {});
  }
}
