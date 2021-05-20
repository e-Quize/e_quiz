class OfflineQuiz {
  String data;
  int quizId;
  int isSynced;

  OfflineQuiz({this.data, this.quizId, this.isSynced});

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['data'] = data;
    map['quizId'] = quizId;
    map['isSynced'] = isSynced;
    return map;
  }

  OfflineQuiz.fromMap(Map<String, dynamic> map) {
    this.data = map['data'];
    this.quizId = map['quizId'];
    this.isSynced = map['isSynced'];
  }
}
