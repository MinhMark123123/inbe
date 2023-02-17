import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? id;
  String? date;
  String? title;
  String? type;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  static List<NotificationModel> fromJsonList(List json) {
    return json.map((e) => NotificationModel.fromJson(e)).toList();
  }

  NotificationModel({
    this.id,
    this.date,
    this.title,
    this.type,
  });
}
