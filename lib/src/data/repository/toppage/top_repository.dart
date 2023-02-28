import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/dto/response/electronic_app_response.dart';
import 'package:inabe/src/data/dto/response/faq_response.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/dto/response/living_guide_response.dart';
import 'package:inabe/src/data/dto/response/other_app_response.dart';
import 'package:inabe/src/di/di_config.dart';

final topRepositoryProvider = Provider.autoDispose<TopRepository>((ref) {
  return _TopRepositoryDefault(
    restClient: ref.read(apiClientProvider),
  );
});

abstract class TopRepository {
  Future<InterestResponse> getInterestsApi();

  Future<LivingGuideResponse> getLivingGuideApi();

  Future<ElectronicAppResponse> getElectronicApps();

  Future<OtherAppResponse> getOtherApps();

  Future<FAQResponse> getFAQs();
}

class _TopRepositoryDefault extends TopRepository {
  final RestClient restClient;

  _TopRepositoryDefault({required this.restClient});

  @override
  Future<InterestResponse> getInterestsApi() {
    return restClient.interests();
  }

  @override
  Future<LivingGuideResponse> getLivingGuideApi() {
    return restClient.livingGuides();
  }

  @override
  Future<ElectronicAppResponse> getElectronicApps() {
    return restClient.electronicApps();
  }

  @override
  Future<OtherAppResponse> getOtherApps() {
    return restClient.otherApps();
  }

  @override
  Future<FAQResponse> getFAQs() {
    return restClient.faqs();
  }
}
