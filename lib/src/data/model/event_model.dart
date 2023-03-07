import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  String? title;
  String? url;
  String? content;
  String? date;

  EventModel({
    this.title,
    this.url,
    this.content,
    this.date,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
