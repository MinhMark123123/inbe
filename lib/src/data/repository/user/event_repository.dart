import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_inabe_client.dart';
import 'package:inabe/src/data/model/event_model.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:xml/xml.dart';

abstract class EventRepository {
  Future<List<EventModel>> getListEvent();
}

final eventRepositoryProvider = Provider.autoDispose<EventRepository>((ref) {
  return _EventRepositoryDefault(restClient: ref.read(thirdClientProvider));
});

class _EventRepositoryDefault extends EventRepository {
  final RestInabeClient restClient;

  final String example = '''<?xml version="1.0" encoding="UTF-8" ?>
<events>
<event>
<eventtitle>「ソウインコンポ」無償配布</eventtitle>
<url>/kurashi/recycle/kankyo/1008512.html</url>
<category>9:その他</category>
<opendays>
<date>2023/05/11</date>
</opendays>
<place2><![CDATA[いなべ市役所 北勢庁舎前駐車場住所：北勢町阿下喜2633番地]]></place2>
</event>
<event>
<eventtitle>【三岐鉄道】「22.2.22記念三岐鉄道全駅入場券セット」発売!!(限定)</eventtitle>
<url>/kurashi/kotsu/tetsudo/1011835.html</url>
<description><![CDATA[【発売期間】令和4年2月22日（火曜日）から12月31日（土曜日）まで ※なくなり次第終了【価&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;格】5,290円（税込）【規&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 格】硬券入場セット（三岐線、北勢線全駅）【数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 量】52セット(限定)【発売場所(営業時間)】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 近鉄富田駅西口&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （午前5時51分～午後11時23分）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;西桑名駅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （午前7時～午後9時）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三岐鉄道本社運輸課 （平日 午前8時30分～午後5時30分）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通信販売&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （2月22日 午前0時～）【問い合わせ先】三岐鉄道株式会社 鉄道部 運輸課 電話059-364-2143&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(※平日 午前8時30分～正午・午後1時～午後5時30分)詳しくは下記の三岐鉄道HPをご覧下さい。]]></description>
<category>9:その他</category>
<opendays>
<date>2022/02/22</date>
</opendays>
</event>
</events>''';

  _EventRepositoryDefault({required this.restClient});

  @override
  Future<List<EventModel>> getListEvent() {
    return restClient
        .getEventData()
        .then((value) => _getData(value));
  }

  List<EventModel> _getData(String value) {
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
}
