import 'package:json_annotation/json_annotation.dart';
part 'faq_model.g.dart';


@JsonSerializable()
class FAQModel {
  String? name;
  List<Faqs>? faqs;

  FAQModel({this.name, this.faqs});

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);

  static List<FAQModel> fromJsonList(List json) {
    return json.map((e) => FAQModel.fromJson(e)).toList();
  }
}


@JsonSerializable()
class Faqs {
  String? question;
  String? answer;

  Faqs({this.question, this.answer});

  factory Faqs.fromJson(Map<String, dynamic> json) =>
      _$FaqsFromJson(json);

  Map<String, dynamic> toJson() => _$FaqsToJson(this);
}