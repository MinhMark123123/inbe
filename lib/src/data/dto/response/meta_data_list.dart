import 'package:json_annotation/json_annotation.dart';

part 'meta_data_list.g.dart';

@JsonSerializable()
class MetaDataList {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'next_page')
  int? nextPage;
  @JsonKey(name: 'prev_page')
  int? prevPage;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_count')
  int? totalCount;
  @JsonKey(name: 'limit_value')
  int? limitValue;

  MetaDataList({
    this.currentPage,
    this.nextPage,
    this.prevPage,
    this.totalCount,
    this.totalPages,
    this.limitValue,
  });

  factory MetaDataList.fromJson(Map<String, dynamic> json) =>
      _$MetaDataListFromJson(json);
}