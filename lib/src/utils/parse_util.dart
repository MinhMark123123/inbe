import 'package:inabe/src/data/model/event_model.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:xml/xml.dart';

class ParseUtils {
  ParseUtils._();

  static List<EventModel> getListEvent(String value) {
    var document = XmlDocument.parse(value);

    final eventNode = document.findElements("events").first;
    final events = eventNode.findElements("event");

    final list = events.take(30).map((xmlEvent) {
      final title = xmlEvent.findElements("eventtitle").first.text;
      final url = xmlEvent.findElements("url").first.text;

      final openDays = xmlEvent.findElements("opendays");
      String? date;
      if (openDays.isNotEmpty) {
        final openDays = xmlEvent.findElements("opendays").first;
        date = openDays.findElements("date").first.text;
      }
      return EventModel(title: title, url: url, date: date);
    }).toList();

    return list;
  }

  static List<NotificationModel>? getData(String value) {
    var rssFeed = RssFeed.parse(value);
    return rssFeed.items
        ?.map((item) => NotificationModel(
            date: item.pubDate?.toIso8601String(),
            title: item.title,
            link: item.link))
        .toList();
  }
}
