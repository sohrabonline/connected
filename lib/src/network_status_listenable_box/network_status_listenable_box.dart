import 'package:flutter/material.dart';

import '../enums/network_status.dart';
import '../mixins/state_mixin.dart';
import '../widgets/custom_animated_cross.dart';
import 'mixin.dart';

class NetworkStatusView extends StatefulWidget {
  const NetworkStatusView({Key? key, this.child, this.connectedChild})
      : super(key: key);
  final Widget? child;
  final Widget? connectedChild;

  @override
  State<NetworkStatusView> createState() => _NetworkStatusViewState();
}

class _NetworkStatusViewState extends State<NetworkStatusView>
    with StateMixin, NetworkStatusListenableBoxMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
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
        second: widget.connectedChild ?? const SizedBox(height: 0),
        showFirst: networkStatus == NetworkStatus.off,
      ),
    );
  }
}
