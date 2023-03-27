import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/dto/response/electronic_app_response.dart';
import 'package:inabe/src/data/dto/response/faq_response.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/dto/response/living_guide_response.dart';
import 'package:inabe/src/data/dto/response/other_app_response.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:inabe/src/utils/date_time_utils.dart';
import 'package:webfeed/webfeed.dart';

final topRepositoryProvider = Provider.autoDispose<TopRepository>((ref) {
  return _TopRepositoryDefault(
    restClient: ref.read(apiClientProvider),
    keyDataSource: ref.read(keyDataSourceProvider),
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
  final KeyDataSource keyDataSource;

  _TopRepositoryDefault({
    required this.restClient,
    required this.keyDataSource,
  });

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
    var list = rssFeed.items
        ?.map((item) => NotificationModel(
            date: item.pubDate?.toIso8601String(),
            title: item.title,
            link: item.link))
        .toList();
    list?.sort((a, b) => _compareTwoDate(a.date, b.date));
    return list;
  }

  int _compareTwoDate(String? before, String? after) {
    var dateBefore = DateTimeUtils.convertToMilliseconds(before);
    var dateAfter = DateTimeUtils.convertToMilliseconds(after);
    return dateAfter.compareTo(dateBefore);
  }

  @override
  Future<List<NotificationModel>?> getNews() {
    return restClient.getNews().then((value) {
      var list = _getData(value);
      saveLastNews(list);
      return list;
    });
  }

  void saveLastNews(List<NotificationModel>? list) {
    keyDataSource.setSecure(SecureKeys.keyLastNews, list?.first.date);
  }
}
