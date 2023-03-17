import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/extensions/context_extesion.dart';

class ConvenienceModel {
  int id;
  String name;
  String? title;
  String path;
  UtilityItem type;

  ConvenienceModel({
    required this.id,
    required this.name,
    this.title,
    required this.path,
    required this.type,
  });
}

extension ConvenenceModelX on ConvenienceModel {
  Map<UtilityItem, Image> _mapImages(BuildContext context) {
    return {
      UtilityItem.EVENT: Assets.images.icEvent.image(
        height: context.screenWidth * 55 / 375,
        fit: BoxFit.fitHeight,
      ),
      UtilityItem.BOOK: Assets.images.icBook.image(
        height: context.screenWidth * 65 / 375,
        fit: BoxFit.fitHeight,
      ),
      UtilityItem.MAGAZING: Assets.images.icMagazine.image(
        height: context.screenWidth * 65 / 375,
        fit: BoxFit.fitHeight,
      ),
      UtilityItem.ELECTRONIC_APP: Assets.images.icElectronicApp.image(
        height: context.screenWidth * 65 / 375,
        fit: BoxFit.fitHeight,
      ),
      UtilityItem.ELECTRONIC_LIB: Assets.images.icElectronicLib.image(
        height: context.screenWidth * 65 / 375,
        fit: BoxFit.fitHeight,
      ),
      UtilityItem.RELATED_APPS: Assets.images.icRelatedApps.image(
        height: context.screenWidth * 65 / 375,
        fit: BoxFit.fitHeight,
      ),
    };
  }

  Image getConvenienceImage(BuildContext context) {
    return _mapImages(context)[type] ??
        Assets.images.icRelatedApps.image(
          height: context.screenWidth * 65 / 375,
          fit: BoxFit.fitHeight,
        );
  }

  Map<UtilityItem, Color> _mapColors() {
    return {
      UtilityItem.EVENT: const Color(0xFFFFE176),
      UtilityItem.BOOK: const Color(0xFFFFAF96),
      UtilityItem.MAGAZING: const Color(0xFFFEC46D),
      UtilityItem.ELECTRONIC_APP: const Color(0xFF94E0F8),
      UtilityItem.ELECTRONIC_LIB: const Color(0xFFE3F47B),
      UtilityItem.RELATED_APPS: const Color(0xFF9DE882),
    };
  }

  Color getConvenienceColor() {
    return _mapColors()[type] ?? Colors.green;
  }
}

enum UtilityItem {
  EVENT,
  BOOK,
  MAGAZING,
  ELECTRONIC_APP,
  ELECTRONIC_LIB,
  RELATED_APPS,
}

//Todo change link
final defaultConveniences = {
  ConvenienceModel(
      id: 0,
      name: str.event_information,
      type: UtilityItem.EVENT,
      path: "/${RouterConstants.home}/${RouterConstants.event}"),
  ConvenienceModel(
      id: 1,
      name: str.convenience_book,
      type: UtilityItem.BOOK,
      path: "/${RouterConstants.home}/${RouterConstants.book}"),
  ConvenienceModel(
      id: 2,
      name: str.magazine_link,
      type: UtilityItem.MAGAZING,
      path: DomainConst.topMagazineUrl),
  // path: "/${RouterConstants.home}/${RouterConstants.magazine}"),
  ConvenienceModel(
      id: 3,
      name: str.electronic_app,
      type: UtilityItem.ELECTRONIC_APP,
      path: "/${RouterConstants.home}/${RouterConstants.electronic_app}"),
  ConvenienceModel(
      id: 4,
      name: str.electronic_library,
      type: UtilityItem.ELECTRONIC_LIB,
      path: DomainConst.topLibraryUrl),
  ConvenienceModel(
      id: 5,
      name: str.related_apps,
      type: UtilityItem.RELATED_APPS,
      path: "/${RouterConstants.home}/${RouterConstants.related_apps}"),
}.toList();
