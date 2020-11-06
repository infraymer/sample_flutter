import 'package:bibimoney/app/remote/base/error/backend_error.dart';
import 'package:dio/dio.dart';

String handleError(error) {
  if (error is DioError && error.error is BackendError) {
    return (error.error as BackendError).message;
  } if (error is BackendError) {
    return error.message;
  } else if (error is DioError) {
    return error.toString() /*'Ошибка соединения'*/;
  } else {
    return error.toString() /*'Неизвестная ошибка'*/;
  }
}