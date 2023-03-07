import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/dto/response/electronic_app_response.dart';
import 'package:inabe/src/data/dto/response/faq_response.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/dto/response/living_guide_response.dart';
import 'package:inabe/src/data/dto/response/other_app_response.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:webfeed/webfeed.dart';

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

  Future<List<TopSliderModel>> getTopSlides();

  Future<List<NotificationModel>?> getNews();
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

  @override
  Future<List<TopSliderModel>> getTopSlides() {
    return restClient.getTopSlides().then((value) => value.data);
  }

  List<NotificationModel>? _getData(String value) {
    var rssFeed = RssFeed.parse(value);
    return rssFeed.items?.map((item) => NotificationModel(
      date: item.pubDate?.toIso8601String(), title: item.title, link: item.link
    )).toList();
  }

  @override
  Future<List<NotificationModel>?> getNews() {
    return restClient.getNews().then((value) => _getData(value));
  }
}
