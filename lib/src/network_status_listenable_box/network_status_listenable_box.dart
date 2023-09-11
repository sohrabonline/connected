import 'package:flutter/material.dart';
import '../mixins/state_mixin.dart';
import '../services/network_service.dart';
import '../widgets/custom_animated_cross.dart';
import 'mixin.dart';

class NetworkStatusView extends StatefulWidget {
  const NetworkStatusView({Key? key}) : super(key: key);

  @override
  State<NetworkStatusView> createState() => _NetworkStatusViewState();
}

class _NetworkStatusViewState extends State<NetworkStatusView>
    with StateMixin, NetworkStatusListenableBoxMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomAnimatedCross(
          first: Container(
            color: Colors.red,
            height: 30,
            child: Center(
              child: Text(
                "No connection",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
          second: SizedBox.shrink(),
          showFirst: networkStatus == NetworkStatus.off,
        ),
      ),
    );
  }
}
