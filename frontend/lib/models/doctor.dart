class Doctor{
  Doctor();
  late int doctor_id;
  String  doctor_name = "";
  String doctor_phone_number = "";
  String doctor_password = "";

  clone(){
    return Doctor.fromJson(this.toJson());
  }

  Doctor.fromJson(Map<String, dynamic>json){

    doctor_id = json['doctor_id'];
    doctor_name = json['doctor_name'];
    doctor_phone_number = json['doctor_phone_number'];
    doctor_password = json['doctor_password'];

  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> doctorJson={
      "doctor_id" : doctor_id,
      "doctor_name" : doctor_name,
      "doctor_phone_number" : doctor_phone_number,
      "doctor_password" : doctor_password,
    };
    return doctorJson;
  }
}
