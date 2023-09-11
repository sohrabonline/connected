import 'package:flutter/material.dart';

import 'network_status_listenable_box/network_status_listenable_box.dart';

class AppConnected extends StatelessWidget {
  const AppConnected({Key? key, required this.widget}) : super(key: key);
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NetworkStatusView(),
        Expanded(child: widget ?? const SizedBox.shrink()),
      ],
    );
  }
}
