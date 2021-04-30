import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:get/get.dart';
import 'package:e_quiz/models/chat/chat_model.dart';

class ChatController extends GetxController {

  var apiController = ApiController();
  var resultUser = Result().obs;
  String selectedObjectKey;

  List<UserEntity> userEntityList;
  List<ChatModel> chatList = [];
  UserEntity userEntity;
  var dbRef;
  String senderId;
  String senderName;

  Future<Result> getAdminsForChat() async {
    Result userEntityDataResult = await apiController.getAdminsForChatFromApi();
    updateUserResult(userEntityDataResult);
    return userEntityDataResult;
  }

  updateUserResult(Result result) {
    this.resultUser.value = result;
  }
}
