import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class ChatModel {
  String selectedChatKey;
  String Message;
  String Optional;
  String Date;
  DateTime timestamp;
  String ReceiverId;
  String ReceiverName;
  String SenderId;
  String Sender;
  bool IsRead;

  ChatModel();

  static List<ChatModel> fromSnapshot(DataSnapshot dataValues) {
    List<ChatModel> chatList = [];
    List<ChatModel> list = [];
    if (dataValues.value != null)
      dataValues.value.forEach((key, value) {
        var chatModel = ChatModel();
        if (value['Date'] != null || value['Date'] != '') {
          chatModel.selectedChatKey = key;
          chatModel.Message = value["Message"];
          chatModel.Optional = value["Optional"];
          chatModel.ReceiverId = value["ReceiverId"];
          chatModel.Date = value["Date"].toString();
          chatModel.timestamp = DateTime.fromMillisecondsSinceEpoch(
              int.parse(chatModel.Date)); //ye kya kia h
          chatModel.ReceiverName = value["ReceiverName"];
          chatModel.SenderId = value["SenderId"];
          chatModel.Sender = value["Sender"];
          chatModel.IsRead = value["IsRead"];

          list.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          list.add(chatModel); //

        }
        chatList = list;
      });
    return chatList;
  }
}
