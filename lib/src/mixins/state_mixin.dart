import 'package:flutter/material.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  onWidgetCompleted(void Function() onCompleted) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onCompleted();
    });
  }
}
