// TODO(BRANDOM): Work on this
import 'package:flit_notes/base/data/exceptions/response_exception.dart';

class ResponseModel<T> {
  ResponseModel._({required this.data, required this.error});

  factory ResponseModel.success(T data) {
    return ResponseModel._(data: data, error: null);
  }

  factory ResponseModel.failure(ResponseException error) {
    return ResponseModel._(data: null, error: error);
  }

  final T? data;
  final ResponseException? error;

  void when({
    required void Function(T data) success,
    required void Function(ResponseException error) failure,
  }) {
    if (isSuccess) {
      success(data as T);
    } else if (isError) {
      failure(error!);
    }
  }

  bool get isSuccess => data != null && error == null;
  bool get isError => data == null && error != null;

  @override
  String toString() {
    return 'ResponseModel{data: $data, error: $error}';
  }
}
