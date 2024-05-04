class User{
  User();
  late int user_id;
  String  user_name = "";
  String user_phone_number = "";
  String user_password = "";
  String user_feedback = "";
  int doctor_id = 0;

  clone(){
    return User.fromJson(this.toJson());
  }

  User.fromJson(Map<String, dynamic>json){

    user_id = json['user_id'];
    user_name = json['user_name'];
    user_phone_number = json['user_phone_number'];
    user_password = json['user_password'];
    user_feedback = json['user_feedback'];
    doctor_id = json['doctor_id'];

  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> userJson={
      "user_id" : user_id,
      "user_name" : user_name,
      "user_phone_number" : user_phone_number,
      "user_password" : user_password,
      "user_feedback" : user_feedback,
      "doctor_id" : doctor_id
    };
    return userJson;
  }
}
