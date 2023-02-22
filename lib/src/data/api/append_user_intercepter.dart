import 'package:dio/dio.dart';

const accessTokenKey='access-token';
const uidKey='uid';
const clientKey='client';

class AppendUserInterceptor extends Interceptor {
  AppendUserInterceptor(this._accessToken, this._uid, this._client);

  final String _accessToken;
  final String _uid;
  final String _client;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[accessTokenKey] = _accessToken;
    options.headers[uidKey] = _uid;
    options.headers[clientKey] = _client;
    super.onRequest(options, handler);
  }
}
