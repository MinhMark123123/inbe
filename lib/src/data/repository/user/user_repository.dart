import 'package:dio/dio.dart' as header;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/dto/request/login_request.dart';
import 'package:inabe/src/data/dto/request/otp_request.dart';
import 'package:inabe/src/data/dto/request/update_user_info_request.dart';
import 'package:inabe/src/data/dto/request/update_user_request.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:retrofit/retrofit.dart';

abstract class UserRepository {
  Future<UserResponse> updateUser(UpdateUserRequest request);

  Future<UserResponse> updateLoginInfo(UpdateUserInfoRequest request);

  Future<HttpResponse<UserResponse>> register(UserRequest request);

  Future<HttpResponse<UserResponse>> login(LoginRequest request);

  Future<void> loginApi(LoginRequest request, Function(UserResponse) onSuccess,
      Function(dynamic) onError);

  Future<bool> isLoggedIn();

  Future<UserResponse> getBasicInfo();

  Future<UserResponse> requestForgotPasswordOTP(String email);

  Future<UserResponse> validForgotPasswordOTP(ForgotPasswordRequest request);

  Future<UserResponse> resetPassword(ForgotPasswordRequest request);

  Future<UserResponse> requestAccountOTP();

  Future<UserResponse> validAccountOTP(OTPRequest request);

  Future<UserResponse> updateAccount(UpdateUserInfoRequest request);

  Future<UserResponse> doLogout();

  void saveTurnOn(bool isTurnOn);

  void saveListCategory(List<String>? categories);

  Future<List<String>> getCategoriesLocal();

  Future<void> clearDataUser();

  Future<void> saveDataLogin(header.Headers headers);

  Future<String> getFCMToken();
}

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
  Future<HttpResponse<UserResponse>> register(UserRequest request) {
    return restClient.register(request);
  }

  @override
  Future<bool> isLoggedIn() async {
    String token = await keyDataSource.getSecure(PrefKeys.keyToken);
    return token.isNotEmpty;
  }

  @override
  Future<void> loginApi(LoginRequest request, Function(UserResponse) onSuccess,
      Function(dynamic) onError) {
    return restClient.login(request).then((value) {
      final headers = value.response.headers;
      saveDataLogin(headers);
      onSuccess.call(value.data);
    }).catchError((e) {
      onError.call(e);
    });
  }

  @override
  Future<void> saveDataLogin(header.Headers headers) async {
    keyDataSource.setSecure(PrefKeys.keyToken, headers.value(accessTokenKey));
    keyDataSource.setSecure(PrefKeys.keyClient, headers.value(clientKey));
    keyDataSource.setSecure(PrefKeys.keyUid, headers.value(uidKey));
  }

  @override
  Future<UserResponse> updateUser(UpdateUserRequest request) {
    return restClient.updateUser(request);
  }

  @override
  Future<UserResponse> updateLoginInfo(UpdateUserInfoRequest request) {
    return restClient.updateLoginInfo(request);
  }

  @override
  Future<UserResponse> getBasicInfo() {
    return restClient.getUserInfo();
  }

  @override
  Future<UserResponse> requestAccountOTP() {
    return restClient.requestOTP();
  }

  @override
  Future<UserResponse> validAccountOTP(OTPRequest request) {
    return restClient.validateOTP(request);
  }

  @override
  Future<UserResponse> updateAccount(UpdateUserInfoRequest request) {
    return restClient.updateLoginInfo(request);
  }

  @override
  Future<UserResponse> doLogout() {
    return restClient.logout();
  }

  @override
  Future<void> clearDataUser() {
    keyDataSource.delete(PrefKeys.keyToken);
    return keyDataSource.clear();
  }

  @override
  Future<UserResponse> requestForgotPasswordOTP(String email) {
    return restClient.recoverPassword(email);
  }

  @override
  Future<UserResponse> resetPassword(ForgotPasswordRequest request) {
    return restClient.resetPassword(request);
  }

  @override
  Future<UserResponse> validForgotPasswordOTP(ForgotPasswordRequest request) {
    return restClient.validOTPPassword(request);
  }

  @override
  void saveListCategory(List<String>? categories) {
    if (categories != null) {
      keyDataSource.setListCategory(categories);
    }
  }

  @override
  Future<List<String>> getCategoriesLocal() {
    return keyDataSource.getListCategory();
  }

  @override
  void saveTurnOn(bool isTurnOn) {
    keyDataSource.setBool(PrefKeys.keyTurnOnNotify, isTurnOn);
    keyDataSource.setSecure(SecureKeys.keyTest, isTurnOn.toString());
  }

  @override
  Future<String> getFCMToken() {
    return keyDataSource.getFCMToken();
  }
}
