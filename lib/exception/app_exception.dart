class AppException implements Exception {
  final String message;

  AppException([this.message = "Unknown error occured"]);
}
