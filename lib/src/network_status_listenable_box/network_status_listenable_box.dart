import 'package:flutter/material.dart';

import '../../connected.dart';
import '../enums/network_status.dart';
import '../mixins/state_mixin.dart';
import '../widgets/custom_animated_cross.dart';
import 'mixin.dart';

class NetworkStatusView extends StatefulWidget {
  const NetworkStatusView(
      {Key? key,
      this.child,
      this.connectedChild,
      this.checkInterval,
      this.connectionTimeOut})
      : super(key: key);
  final Widget? child;
  final Widget? connectedChild;
  final Duration? checkInterval;
  final Duration? connectionTimeOut;

  @override
  State<NetworkStatusView> createState() => _NetworkStatusViewState();
}

class _NetworkStatusViewState extends State<NetworkStatusView>
    with StateMixin, NetworkStatusListenableBoxMixin {
  @override
  void initState() {
    super.initState();
    // print("widget.checkInterval:  ${widget.checkInterval}");
    // print("widget.connectionTimeOut:  ${widget.connectionTimeOut}");
    networkService = NetworkService(
        timeOut: widget.connectionTimeOut, checkInterval: widget.checkInterval);
    onWidgetCompleted(() {
      checkWhenStartUP();
      startListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CustomAnimatedCross(
        first: widget.child ??
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: Colors.red,
              height: 30,
              child: const Center(
                child: Text(
                  "No connection",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
        second: widget.connectedChild ??
            Container(color: widget.child == null ? Colors.red : Colors.white),
        showFirst: networkStatus == NetworkStatus.off,
      ),
    );
  }
}
