abstract class BaseResponse<Model> {
  Model data;
  String message;
  int code;

  BaseResponse({
    required this.data,
    required this.message,
    required this.code,
  });
}
