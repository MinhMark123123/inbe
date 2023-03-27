import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/dto/response/email_response.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';

abstract class EmailRepository {
  Future<EmailResponse> getListEmail(int page, int perPage);
}

final emailRepositoryProvider = Provider.autoDispose<EmailRepository>((ref) {
  return EmailRepositoryDefault(
    restClient: ref.read(apiClientProvider),
    keyDataSource: ref.read(keyDataSourceProvider),
  );
});

class EmailRepositoryDefault extends EmailRepository {
  final RestClient restClient;
  final KeyDataSource keyDataSource;

  void saveLastNews(List<EmailModel> list) {
    keyDataSource.setSecure(SecureKeys.keyLastEmail, list.first.publishedAt);
  }

  EmailRepositoryDefault({
    required this.restClient,
    required this.keyDataSource,
  });

  @override
  Future<EmailResponse> getListEmail(int page, int perPage) {
    return restClient.getMyEmails(page, perPage).then((value) {
      if (page == 0) {
        saveLastNews(value.data);
      }
      return value;
    });
  }
}
