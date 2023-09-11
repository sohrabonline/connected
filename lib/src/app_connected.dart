import 'package:flutter/material.dart';

import 'network_status_listenable_box/network_status_listenable_box.dart';

class Connected extends StatelessWidget {
  const Connected(
      {Key? key, required this.widget, this.child, this.connectedChild})
      : super(key: key);
  final Widget? widget;
  final Widget? child;
  final Widget? connectedChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NetworkStatusView(child: child, connectedChild: connectedChild),
        Expanded(child: widget ?? const SizedBox.shrink()),
      ],
    );
  }
}
