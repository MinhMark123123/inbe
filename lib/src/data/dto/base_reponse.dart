abstract class BaseResponse<Model> {
  Model data;
  String? message;
  int? code;

  BaseResponse({
    required this.data,
    this.message,
    this.code,
  });
}

abstract class BaseData {
  String? message;

  BaseData({this.message});
}
