import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';

abstract class ForgotPasswordRepository {
  Future<UserResponse> requestForgotPasswordOTP(String email);

  Future<UserResponse> validForgotPasswordOTP(ForgotPasswordRequest request);

  Future<UserResponse> resetPassword(ForgotPasswordRequest request);
}

final forgotPasswordRepositoryProvider =
    Provider.autoDispose<ForgotPasswordRepository>((ref) {
  return _ForgotPasswordRepository(
    restClient: ref.read(apiClientProvider),
    keyDataSource: ref.read(keyDataSourceProvider),
  );
});

class _ForgotPasswordRepository extends ForgotPasswordRepository {
  final RestClient restClient;
  final KeyDataSource keyDataSource;

  // final UserRetrofitService userRetrofitService;

  _ForgotPasswordRepository({
    required this.restClient,
    required this.keyDataSource,
  });

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
}
