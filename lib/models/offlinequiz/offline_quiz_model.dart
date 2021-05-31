class OfflineQuiz {
  int id;
  String data;
  int quizId;
  int isSynced;

  OfflineQuiz({this.id, this.data, this.quizId, this.isSynced});

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['data'] = data;
    map['quizId'] = quizId;
    map['isSynced'] = isSynced;
    return map;
  }

  OfflineQuiz.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.data = map['data'];
    this.quizId = map['quizId'];
    this.isSynced = map['isSynced'];
  }
}
