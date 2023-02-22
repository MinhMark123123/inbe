import 'package:dio/dio.dart';

class AppendInterceptor extends Interceptor {
  AppendInterceptor(this._accept, this._contentType, this._token);

  final String _accept;
  final String _contentType;
  final String _token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['accept'] = _accept;
    options.headers['Content-Type'] = _contentType;
    options.headers['authorization'] = "Bearer $_token";
    super.onRequest(options, handler);
  }
}
