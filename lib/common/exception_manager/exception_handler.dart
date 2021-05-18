import 'package:dio/dio.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/screens/authentication/signin_screen.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/dialog_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        if (error.error == Exceptions.HTTP_401) {
          result.code = Exceptions.UNATHORIZED_CODE;
          result.message = Exceptions.UNATHORIZED_MESSAGE;
          showLogoutPopUp();
        }
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

  static showLogoutPopUp() async {
    var apiController = ApiController();
   await apiController.logoutUserFromAllDevicesFromApi();
    DialogClass.showLogoutDialog(
      Get.context,
      () {
        Navigator.pushAndRemoveUntil(Get.context,
            MaterialPageRoute(builder: (context) {
          return SigninScreen();
        }), (route) => false);
      },
    );
  }
}
