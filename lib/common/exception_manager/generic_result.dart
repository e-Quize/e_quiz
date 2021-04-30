import 'package:e_quiz/models/common/result_model.dart';

import 'exception_codes_messages.dart';

class Generic {
  static Result waitResult() {
    var res = Result();
    res.code = Exceptions.WAITING;
    res.message = Exceptions.WAITING_MESSAGE;
    return res;
  }
}
