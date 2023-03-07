import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/dto/response/email_response.dart';
import 'package:inabe/src/di/di_config.dart';

abstract class EmailRepository {
  Future<EmailResponse> getListEmail(int page, int perPage);
}

final emailRepositoryProvider = Provider.autoDispose<EmailRepository>((ref) {
  return EmailRepositoryDefault(restClient: ref.read(apiClientProvider));
});

class EmailRepositoryDefault extends EmailRepository {
  final RestClient restClient;

  EmailRepositoryDefault({required this.restClient});

  @override
  Future<EmailResponse> getListEmail(int page, int perPage) {
    return restClient.getMyEmails(page, perPage);
  }
}
