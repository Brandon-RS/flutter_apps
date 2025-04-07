class ResponseException implements Exception {
  const ResponseException({required this.message, this.code});
  final String message;
  final int? code;

  @override
  String toString() {
    return 'ResponseException: $message (status code: $code)';
  }
}
