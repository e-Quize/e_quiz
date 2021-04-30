import 'package:e_quiz/controllers/chat_controller.dart';
import 'package:e_quiz/customwidget/custom_text_widget.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/chat/chat_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  final TextEditingController chatTextController = TextEditingController();

  var chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: CircleAvatar(
        //   radius: 30.0,
        //   backgroundImage:

        //   NetworkImage('https://via.placeholder.com/150'),
        //   backgroundColor: Colors.transparent,
        // ),
        centerTitle: true,
        backgroundColor: AppColors.unCheckedBottomNavigationIconColor,
        title: Text(
          chatController.userEntity.UserName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ),
      body: GetBuilder<ChatController>(
        initState: (child) async {
          getUserFromLocalDb();
          chatController.dbRef = FirebaseDatabase.instance
              .reference()
              .child(Constants.CHAT_TABLE)
              .orderByChild("Optional")
              .equalTo('Chat')
              // .orderByChild('SenderId')
              // .equalTo(chatController.senderId)
              .onValue;
        },
        builder: (_) {
          return Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: chatController.dbRef,
                      builder: (context, AsyncSnapshot<Event> snapshot) {
                        if (snapshot.hasData) {
                          chatController.chatList.clear();
                          DataSnapshot dataValues = snapshot.data.snapshot;
                          List<ChatModel> list =
                              ChatModel.fromSnapshot(dataValues);
                          chatController.chatList = list
                              .where((element) =>
                                  element.SenderId == chatController.senderId ||
                                  element.SenderId ==
                                      chatController.userEntity.FbUserId)
                              .toList();

                          return Container(
                            // height: MediaQuery.of(context).size.height / 2,
                            child: buildChatList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      cursorColor: AppColors.unCheckedBottomNavigationIconColor,
                      validator: (value) =>
                          value.isEmpty ? 'Message can not be blank' : null,
                      controller: chatTextController,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              sendMessage();
                              chatTextController.text = "";
                            },
                            child: Icon(Icons.send),
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter a Message...'),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildChatList() {
    if (chatController.chatList.isEmpty) {
      return Center(
        child: CustomWidget(
            title: Constants.NO_MESSAGE_FOUND,
            color: AppColors.unCheckedBottomNavigationIconColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: chatController.chatList != null
              ? chatController.chatList.length
              : 0,
          itemBuilder: (BuildContext context, int index) {
            return chatListWidget(index);
          });
    }
  }

  Widget receiverChatWidget(int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 15.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                color: Colors.green),
            padding: EdgeInsets.all(16.0),
            child: Text(
              chatController.chatList != null
                  ? chatController.chatList[index].Message ?? "Hello"
                  : '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            height: 38.0,
            width: 38.0,
            transform: Matrix4.translationValues(-15.0, -25.0, 0.0),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: SvgPicture.asset(
                  Constants.PERSON_IMAGE_NAME,
                  height: 28.0,
                  width: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget senderChatWidget(int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            padding: EdgeInsets.all(16.0),
            child: Text(
              chatController.chatList[index].Message ?? "Hello",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            height: 38.0,
            width: 38.0,
            transform: Matrix4.translationValues(-15.0, -25.0, 0.0),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: SvgPicture.asset(
                  Constants.PERSON_IMAGE_NAME,
                  height: 28.0,
                  width: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatListWidget(int index) {
    if (chatController.chatList[index].SenderId == chatController.senderId) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 1,
            child: senderChatWidget(index),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: receiverChatWidget(index),
          ),
        ],
      );
    }
  }

  sendMessage() async {
    await FirebaseDatabase.instance
        .reference()
        .child(Constants.CHAT_TABLE)
        .push()
        .set({
      "Message": chatTextController.text,
      "ReceiverId": chatController.userEntity.FbUserId,
      "ReceiverName": chatController.userEntity.UserName,
      "SenderId": chatController.senderId,
      "Optional": "Chat",
      "Date": ServerValue.timestamp,
      "Sender": chatController.senderName,
      "IsRead": false
    });
  }

  getUserFromLocalDb() async {
    UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
    chatController.senderId = userEntityCopy.FbUserId;
    chatController.senderName = userEntityCopy.UserName;
  }

  Widget buildChatWidget(int index, BuildContext buildContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: (chatController.chatList[index].ReceiverId ==
                  chatController.senderId)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.black)),
                          child: Text(chatController.chatList[index].Message),
                        ))
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            color: AppColors.unCheckedBottomNavigationIconColor,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.black)),
                        child: Text(
                          chatController.chatList[index].Message,
                          style: TextStyle(
                              color:
                                  AppColors.unCheckedBottomNavigationIconColor),
                        ),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
