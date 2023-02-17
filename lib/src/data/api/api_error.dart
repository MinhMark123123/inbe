class ApiError {
  ApiError({required this.exception});

  final dynamic exception;

  // String error() {
  //   switch (obj.runtimeType) {
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
