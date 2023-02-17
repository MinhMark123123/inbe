import 'package:json_annotation/json_annotation.dart';
part 'electronic_app_model.g.dart';


@JsonSerializable()
class ElectronicAppModel {
  int? id;
  String? name;
  List<MiddleCategories>? middleCategories;

  ElectronicAppModel({this.id, this.name, this.middleCategories});

  factory ElectronicAppModel.fromJson(Map<String, dynamic> json) =>
      _$ElectronicAppModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElectronicAppModelToJson(this);

  static List<ElectronicAppModel> fromJsonList(List json) {
    return json.map((e) => ElectronicAppModel.fromJson(e)).toList();
  }
}


@JsonSerializable()
class MiddleCategories {
  int? id;
  String? name;
  List<Procedures>? procedures;

  MiddleCategories({this.id, this.name, this.procedures});

  factory MiddleCategories.fromJson(Map<String, dynamic> json) =>
      _$MiddleCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$MiddleCategoriesToJson(this);

  static List<MiddleCategories> fromJsonList(List json) {
    return json.map((e) => MiddleCategories.fromJson(e)).toList();
  }
}

@JsonSerializable()
class Procedures {
  String? name;
  String? detailUrl;
  String? formUrl;

  Procedures({this.name, this.detailUrl, this.formUrl});

  factory Procedures.fromJson(Map<String, dynamic> json) =>
      _$ProceduresFromJson(json);

  Map<String, dynamic> toJson() => _$ProceduresToJson(this);
}