import 'package:flutter/material.dart';

import 'network_status_listenable_box/network_status_listenable_box.dart';

class Connected extends StatelessWidget {
  const Connected(
      {Key? key,
      required this.widget,
      this.child,
      this.connectedChild,
      this.checkInterval,
      this.connectionTimeOut})
      : super(key: key);
  final Widget? widget;
  final Widget? child;
  final Widget? connectedChild;
  final Duration? checkInterval;
  final Duration? connectionTimeOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NetworkStatusView(
            connectedChild: connectedChild,
            connectionTimeOut: connectionTimeOut,
            checkInterval: checkInterval,
            child: child),
        Expanded(child: widget ?? const SizedBox.shrink()),
      ],
    );
  }
}
