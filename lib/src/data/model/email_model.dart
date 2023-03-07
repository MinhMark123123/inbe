import 'package:json_annotation/json_annotation.dart';

part 'email_model.g.dart';

@JsonSerializable()
class EmailModel {
  int? id;
  String? title;
  @JsonKey(name: 'category_name')
  String? categoryName;
  String? content;
  @JsonKey(name: 'published_at')
  String? publishedAt;

  EmailModel({
    this.id,
    this.title,
    this.categoryName,
    this.content,
    this.publishedAt,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);
}
