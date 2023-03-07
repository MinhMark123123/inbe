import 'package:dio/dio.dart';
import 'package:inabe/src/data/api/append_intercepter.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/api/retrofit_inabe_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:riverpod/riverpod.dart';

const applicationJson = 'application/json';

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio()
    ..interceptors
        .add(AppendInterceptor(applicationJson, applicationJson, ''));
  return dio;
});

final dioStateProvider = Provider<Dio>((ref) {
  Dio dio = Dio()
    ..interceptors
        .add(AppendInterceptor(applicationJson, applicationJson, ''));
  dio.interceptors.add(AuthUserInterceptor(KeyDataSource()));
  return dio;
});

final apiClientProvider = Provider<RestClient>((ref) {
  return RestClient(ref.read(dioStateProvider));
});

final thirdClientProvider = Provider<RestInabeClient>((ref) {
  return RestInabeClient(ref.read(dioProvider));
});

final keyDataSourceProvider = Provider<KeyDataSource>((ref) {
  return KeyDataSource();
});
