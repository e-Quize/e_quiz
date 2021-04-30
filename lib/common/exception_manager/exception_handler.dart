import 'package:dio/dio.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:sqflite/sqflite.dart';

import 'exception_codes_messages.dart';

class ExceptionHandler {
  static Result onError(Object o) {
    if (o is DioError) {
      return _handleDioError(o);
    } else if (o is DatabaseException) {
      return _handleDatabase(o);
    } else {
      return _unknownException();
    }
  }

  static Result _handleDioError(DioError error) {
    var result = Result();

    if (error.type is DioErrorType) {
      if (error.type == DioErrorType.DEFAULT) {
        result.code = error.error.osError.errorCode;
        result.message = Exceptions.NO_INTERNET;
      } else if (error.type == DioErrorType.RESPONSE) {
        result.code = error.response.statusCode;
        result.message = error.response.statusMessage;
      } else {
        result.code = error.response.statusCode;
        result.message = error.response.statusMessage;
      }
    } else {
      if (error.error == Exceptions.HTTP_401) {
        result.code = Exceptions.UNATHORIZED_CODE;
        result.message = Exceptions.UNATHORIZED_MESSAGE;
      } else {
        result.code = error.response.statusCode;
        result.message = error.response.statusMessage;
      }
    }
    return result;
  }

  static Result _handleDatabase(DatabaseException error) {
    var result = Result();
    result.code = error.getResultCode();
    result.message = error.toString();
    return result;
  }

  static Result _unknownException() {
    var result = Result();
    result.code = Exceptions.UNKNOWN;
    result.message = Exceptions.UNKNOWN_MESSAGE;
    return result;
  }
}
