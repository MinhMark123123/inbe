import 'package:dio/dio.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';

const accessTokenKey = 'access-token';
const uidKey = 'uid';
const clientKey = 'client';

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

class AuthUserInterceptor extends Interceptor {
  final KeyDataSource keyData;

  AuthUserInterceptor(this.keyData);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await keyData.getSecure(PrefKeys.keyToken);
    final uid = await keyData.getSecure(PrefKeys.keyUid);
    final client = await keyData.getSecure(PrefKeys.keyClient);
    if(token.isEmpty || uid.isEmpty || clientKey.isEmpty){
      return super.onRequest(options, handler);
    }
    options.headers[accessTokenKey] = token;
    options.headers[uidKey] = uid;
    options.headers[clientKey] = client;
    super.onRequest(options, handler);
  }
}
