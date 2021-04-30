import 'package:e_quiz/controllers/chat_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/screens/chat/chat_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  var chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    // <1> Use FutureBuilder
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.unCheckedBottomNavigationIconColor,
        title: Text(
          Constants.USER_LIST,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ),
      body: GetBuilder<ChatController>(
        init: chatController,
        initState: (child) {
          getAdminsForChat();
        },
        builder: (_) {
          return Container(
            child: buildUserList(),
          );
        },
      ),
    );
  }

  Widget buildUserList() {
    if (chatController.userEntityList == null) {
      return Center(
        child: Container(
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: chatController.userEntityList.length,
          itemBuilder: (BuildContext context, int index) {
            return buildUserWidget(index, context);
          });
    }
  }

  Widget buildUserWidget(int index, BuildContext buildContext) {
    return InkWell(
        splashColor: AppColors.unCheckedBottomNavigationIconColor,
        // read the index key
        onTap: () {
          chatController.userEntity = chatController.userEntityList[index];
          chatController.selectedObjectKey =
              chatController.userEntityList[index].FbUserId;
          print("Selected User Key: " + chatController.selectedObjectKey);
          Navigator.push(
            buildContext,
            _createRoute(),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                    color: AppColors.unCheckedBottomNavigationIconColor)),
            elevation: 0.0,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(
                              Constants.PROFILE_ADMIN,
                            ),
                            backgroundColor: Colors.transparent,
                          )),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            chatController.userEntityList[index].UserName
                                .toString(),
                            style: TextStyle(
                                color: AppColors
                                    .unCheckedBottomNavigationIconColor,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 30.0,
                          color: AppColors.unCheckedBottomNavigationIconColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  getAdminsForChat() async {
    Result result = await chatController.getAdminsForChat();
    if (result != null) chatController.userEntityList = result.body;
    chatController.update();
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
