import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';

class ConvenienceModel {
  int id;
  String name;
  String? title;
  String path;

  ConvenienceModel({
    required this.id,
    required this.name,
    this.title,
    required this.path,
  });
}

enum UtilityItem {
  EVENT,
  BOOK,
  MAGAZING,
  ELECTRONIC_APP,
  ELECTRONIC_LIB,
  RELATED_APPS,
}

final conveniences = {
  ConvenienceModel(
      id: 0,
      name: str.event_information,
      path: "/${RouterConstants.home}/${RouterConstants.event}"),
  ConvenienceModel(
      id: 1,
      name: str.convenience_book,
      path: "/${RouterConstants.home}/${RouterConstants.book}"),
  ConvenienceModel(
      id: 2,
      name: str.magazine_link,
      path: "/${RouterConstants.home}/${RouterConstants.magazine}"),
  ConvenienceModel(
      id: 3,
      name: str.electronic_app,
      path: "/${RouterConstants.home}/${RouterConstants.electronic_app}"),
  ConvenienceModel(
      id: 4,
      name: str.electronic_library,
      path: "/${RouterConstants.home}/${RouterConstants.electronic_lib}"),
  ConvenienceModel(
      id: 5,
      name: str.related_apps,
      path: "/${RouterConstants.home}/${RouterConstants.related_apps}"),
}.toList();
