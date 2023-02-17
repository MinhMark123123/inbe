import 'package:dio/dio.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final apiClientProvider = Provider<RestClient>((ref) {
  return RestClient(ref.read(dioProvider));
});

final thirdClientProvider = Provider<RestClient>((ref) {
  return RestClient(ref.read(dioProvider), baseUrl: "aaaa");
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
