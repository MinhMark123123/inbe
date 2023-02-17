import 'package:inabe/src/utils/extensions/asset_extension.dart';

class SliderModel {
  int id;
  String name;
  String link;

  SliderModel({
    required this.id,
    required this.name,
    required this.link,
  });
}

final sliderListDefault = {
  SliderModel(
      id: 0,
      name: str.event_information,
      link: "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
  SliderModel(
      id: 1,
      name: str.convenience_book,
      link: "https://images.unsplash.com/photo-1522205408450-add114ad53fe"),
  SliderModel(
      id: 2,
      name: str.magazine_link,
      link: "https://images.unsplash.com/photo-1522205408450-add114ad53fe"),
  SliderModel(
      id: 3,
      name: str.electronic_app,
      link: "https://images.unsplash.com/photo-1522205408450-add114ad53fe"),
  SliderModel(
      id: 4,
      name: str.electronic_library,
      link: "https://images.unsplash.com/photo-1522205408450-add114ad53fe"),
  SliderModel(
      id: 5,
      name: str.related_apps,
      link: "https://images.unsplash.com/photo-1522205408450-add114ad53fe"),
}.toList();
