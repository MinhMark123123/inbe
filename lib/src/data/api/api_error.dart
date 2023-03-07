import 'package:dio/dio.dart';

typedef OnErrorData = void Function(int? code, String? message);

class ApiError {
  final dynamic exception;
  final OnErrorData errorData;
  late ErrorData _errorData;

  ApiError(this.exception, {required this.errorData}) {
    switch (exception.runtimeType) {
      case DioError:
        final res = (exception as DioError).response;
        if (res != null) {
          Map<String, dynamic> baseRes = res.data;
          print("Got error : ${res.statusCode} "
              ": ${res.statusMessage} : ${baseRes["error"]['message']}");
          errorData.call(res.statusCode, baseRes["error"]['message']);
          _errorData = ErrorData(res.statusCode, baseRes["error"]['message']);
        } else {
          errorData.call(0, "No reason");
          _errorData = ErrorData(0, "No reason");
        }
        break;
      default:
        errorData.call(1001, "No reason");
        _errorData = ErrorData(1001, "No reason");
        break;
    }
  }

  ErrorData pretty() {
    return _errorData;
  }

// String handleError() {
//   switch (exception.runtimeType) {
//     case DioError:
//       final res = (obj as DioError).response;
//       print("Got error : ${res?.statusCode} : ${res?.statusMessage}");
//       uiState.update((state) => state.copyWith(
//           errorMessage: res?.statusMessage ?? "Request api error"));
//       break;
//     default:
//       uiState
//           .update((state) => state.copyWith(errorMessage: "Default error"));
//       break;
//   }
// }
}

class ErrorData {
  int? code;
  String message;

  ErrorData(this.code, this.message);
}
