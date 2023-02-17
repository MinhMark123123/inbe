abstract class BaseListResponse<Model> {
  List<Model> data;
  String? message;
  int? code;

  BaseListResponse({
    required this.data,
    this.message,
    this.code,
  });
}
