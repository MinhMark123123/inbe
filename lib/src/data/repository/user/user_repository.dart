import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/dto/request/login_request.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:retrofit/retrofit.dart';

abstract class UserRepository {
  Future<UserResponse> register(UserRequest request);

  Future<HttpResponse<UserResponse>> login(LoginRequest request);

  Future<void> loginApi(LoginRequest request, Function(UserResponse) onSuccess,
      Function(dynamic) onError);

  bool isLoggedIn();
}

// final _registerPageUiStateProvider =
// StateProvider.autoDispose<UserRetrofitService>((ref) {
//   return UserRetrofitService();
// });

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  return _UserRepositoryDefault(
    restClient: ref.read(apiClientProvider),
    keyDataSource: ref.read(keyDataSourceProvider),
  );
});

class _UserRepositoryDefault extends UserRepository {
  final RestClient restClient;
  final KeyDataSource keyDataSource;

  // final UserRetrofitService userRetrofitService;

  _UserRepositoryDefault({
    // required this.userRetrofitService,
    required this.restClient,
    required this.keyDataSource,
  });

  @override
  Future<HttpResponse<UserResponse>> login(LoginRequest request) {
    return restClient.login(request);
  }

  @override
  Future<UserResponse> register(UserRequest request) {
    return restClient.register(request);
  }

  @override
  bool isLoggedIn() {
    String token = keyDataSource.get(PrefKeys.keyToken);
    return token.isNotEmpty;
  }

  @override
  Future<void> loginApi(LoginRequest request, Function(UserResponse) onSuccess,
      Function(dynamic) onError) {
    return restClient.login(request).then((value) {
      final headers = value.response.headers;
      print("ttt $value ::: ${headers.value("access-token")}");
      print("ttt $value ::: ${headers.value("uid")}");
      print("ttt $value ::: ${headers.value("client")}");
      keyDataSource.set(PrefKeys.keyToken, headers.value(accessTokenKey));
      keyDataSource.set(PrefKeys.keyClient, headers.value(clientKey));
      keyDataSource.set(PrefKeys.keyUid, headers.value(uidKey));
      onSuccess.call(value.data);
    }).catchError((onError) {
      onError.call(onError);
    });
  }
}
