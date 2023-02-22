import 'package:dio/dio.dart';
import 'package:inabe/src/data/api/append_intercepter.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:riverpod/riverpod.dart';

const applicationJson = 'application/json';

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio()
    ..interceptors
        .add(AppendInterceptor(applicationJson, applicationJson, 'aaa'));
  return dio;
});

final dioStateProvider = StateProvider<Dio>((ref) {
  Dio dio = Dio()
    ..interceptors
        .add(AppendInterceptor(applicationJson, applicationJson, 'aaa'));
  final keyData = KeyDataSource();
  final token = keyData.get(PrefKeys.keyToken);
  final uid = keyData.get(PrefKeys.keyUid);
  final client = keyData.get(PrefKeys.keyClient);
  dio.interceptors.add(AppendUserInterceptor(token, uid, client));
  return dio;
});

final apiClientProvider = Provider<RestClient>((ref) {
  return RestClient(ref.read(dioStateProvider));
});

final thirdClientProvider = Provider<RestClient>((ref) {
  return RestClient(ref.read(dioProvider), baseUrl: "aaaa");
});

final keyDataSourceProvider = Provider<KeyDataSource>((ref) {
  return KeyDataSource();
});

//
// @module
// abstract class AppModule {
//   // @lazySingleton
//   // AppNavigator get appNavigator => AppNavigator();
//   //
//   // @lazySingleton
//   // KeyDataSource get keyDataSource => KeyDataSource();
//   //
//   // @lazySingleton
//   // PackageInfo get packageInfo => PackageUtils.packageInfo;
//
//   // @lazySingleton
//   // AppInfo get appInfo => AppInfo(packageInfo.appName, packageInfo.packageName,
//   //     packageInfo.version, packageInfo.buildNumber);
//
//   @lazySingleton
//   Dio get trackingDio => Dio();
//
//   @lazySingleton
//   RestClient get restClientA => RestClient(getIt.get());
// }
//
// final RestClient aaa = getIt.get();
