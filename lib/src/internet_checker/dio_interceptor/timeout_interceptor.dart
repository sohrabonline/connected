import 'dart:developer';

import 'package:connected/src/configs/config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../internet_connection.dart';

class TimeoutInterceptor extends Interceptor {
  final int timeoutSeconds;
  int errorTime = 0;

  TimeoutInterceptor({required this.timeoutSeconds});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.connectTimeout = Duration(seconds: timeoutSeconds);
    // options.receiveTimeout = Duration(seconds: timeoutSeconds);
    // options.sendTimeout = Duration(seconds: timeoutSeconds);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // errorTime++;
    // print("errerr: ${err.type}");
    // print("errorTime: ${errorTime}");
    if (err.type == DioExceptionType.connectionTimeout
        //   ||  err.type == DioExceptionType.connectionError
        ) {
      // bool isConnected = false;
      // while (!isConnected && errorTime < 3) {
      //   //errorTime++;
      //   log("error time is this:  $errorTime");
      //   // Delay for 10 seconds and check the connection again.
      //   await Future.delayed(const Duration(seconds: 10));
      //   isConnected = await checkInternetConnection();
      //   errorTime++;
      // }

      // errorTime = 0;
      //Sleep for the specified timeout before returning an error
      // Future.delayed(Duration(seconds: timeoutSeconds))
      //     .then((_) => handler.next(err));
      handler.next(err);
    } else {
      handler.next(err);
    }
  }

  Future<bool> checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
        return true;
      default:
        return false;
    }
  }
}
