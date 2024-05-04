class History{
  History();
  late int history_id;
  String history_data = "";
  int history_user_id = 0;

  clone(){
    return History.fromJson(this.toJson());
  }

  History.fromJson(Map<String, dynamic>json){

    history_id = json['history_id'];
    history_data = json['history_data'];
    history_user_id = json['history_user_id'];

  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> historyJson={
      "history_id" : history_id,
      "history_data" : history_data,
      "history_user_id" : history_user_id
    };
    return historyJson;
  }
}
