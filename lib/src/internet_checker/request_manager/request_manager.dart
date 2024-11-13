import 'package:dio/dio.dart';

import '../../configs/config.dart';
import '../dio_interceptor/timeout_interceptor.dart';
import '../internet_check_option.dart';

class LastRequestManager {
  final InternetCheckOption option;
  late Dio? _dio;

  LastRequestManager({required this.option}) {
    _dio ??= Dio(BaseOptions(
        connectTimeout: option.timeout,
        receiveTimeout: option.timeout,
        sendTimeout: option.timeout))
      ..interceptors.add(TimeoutInterceptor(
          timeoutSeconds: option.timeout?.inSeconds ?? Configs.timeOut));
  }

//  LastRequestManager({required this.option});

  CancelToken cancelToken = CancelToken();

  Future<Response<dynamic>?> sendLastRequest() async {
    // Cancel the previous request if it's still pending.
    // cancelToken.cancel("Request canceled");
    // cancelToken = CancelToken();

    // try {
    //   // Send the new request with the cancel token.
    //   final response = await _dio?.head(option.uri.toString());
    //   return response;
    // } on DioException catch (e) {
    //   if (CancelToken.isCancel(e)) {
    //     // Request was canceled, handle this as needed.
    //     print('Request was canceled.');
    //   } else {
    //     // Handle other Dio errors.
    //     print('Dio error: $e');
    //   }
    //   return Response(
    //       data: null,
    //       requestOptions: e
    //           .requestOptions); // Return an empty response or handle the error accordingly.
    // }
    final response = await _dio?.head(option.uri.toString());
    return response;
  }
}
