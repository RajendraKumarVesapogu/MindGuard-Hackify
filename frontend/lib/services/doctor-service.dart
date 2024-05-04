import 'dart:convert';
import 'package:frontend/models/doctor.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/models/serverResponse.dart';
import 'package:frontend/common/constants.dart';

class DoctorService {
  static const String PATH = "/doctor";
  static const String PATH_GET = "/doctor/users";
  static const String PATH_UPDATE = "/doctor/update";
  static const String PATH_SELF_REG = "/doctor/profile";

  // http://localhost:3456/Doctor/users/2?authtoken=233fd10adb718a50f6c8d912050658524d0ccf23
//=====================================================================================================================================

  Future<ServerResponse> createUser(User user, String authtoken) async {
    User createdUser = User();
    ServerResponse serverResponse;
    String url;
    url = Constants.SERVER + PATH + ((authtoken != "")
        ?( "?authtoken=" + authtoken) : "/create");
    var userJson = user.toJson();
    print(url);
    userJson['password'] =
        sha512.convert(utf8.encode(userJson['password'])).toString();
    var body = json.encode(userJson);
    print(body);
    try {
      var response = await http.post(Uri.parse(url),  // checkkkkkkkkk
          body: body, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print("point2");
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        if (serverResponse.ifSuccess()) {
          createdUser = User.fromJson(serverResponse.data);
        }
        serverResponse.result = createdUser;
      } else {
        serverResponse =
            ServerResponse(ServerResponse.FAILED, response.toString());
      }
    }
    catch (e) {
      serverResponse = ServerResponse(ServerResponse.FAILED, e.toString());
    }
    return serverResponse;
  }

//=====================================================================================================================================

  Future<ServerResponse> getDoctor(String? authtoken) async {
    // String url = Constants.SERVER + PATH + "?authtoken=" + authtoken!;
    String url = "http://localhost:5000/doctor/users?authtoken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJudW1iZXIiOiIxMjMiLCJ1c2VyX2lkIjoxLCJpYXQiOjE3MTQ3NzMzNzEsImV4cCI6MTcxNDc3Njk3MX0.FJyOM0xBv4fe9SaqXqfpVmcFFfiJYuYBiKqZrqe8Btw&doctorId=3";
    ServerResponse serverResponse = await fetchDoctorFromServer(url);
    return serverResponse;
  }

//=====================================================================================================================================

  Future<ServerResponse> fetchDoctorFromServer(String url) async {
    ServerResponse serverResponse;
    try {
      var response = await http.get(Uri.parse(url),headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        if (serverResponse.ifSuccess()) {
          List<int> compressed = [];
          var DoctorData = serverResponse.data;

          serverResponse.result = DoctorData;
        }
      } else {
        serverResponse =
            ServerResponse(ServerResponse.FAILED, response.toString());
      }
    }
    catch (e) {
      serverResponse = ServerResponse(ServerResponse.FAILED, e.toString());
    }
    return serverResponse;
  }

//=====================================================================================================================================

  Future<ServerResponse> getAllUsers(String? authtoken) async {
    String url = Constants.SERVER + PATH +"/users"+"?authtoken=" + authtoken!+'&doctorId=3';
    return fetchUsersFromServer(url);
  }

//=====================================================================================================================================

  // Future<ServerResponse> getAllMembers(String? authtoken,int? DoctorId) async {
  //   String url = Constants.SERVER + PATH_GET +"/${DoctorId!}?authtoken=" + authtoken!;
  //   return fetchUsersFromServer(url);
  // }
  //=====================================================================================================================================
  Future<ServerResponse> fetchUsersFromServer(String url) async {
    ServerResponse serverResponse;
    List<User> users;
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        if (serverResponse.ifSuccess()) {
          List<int> compressed = [];
          var userData = serverResponse.data.toList();
          users = [];
          if (userData is List) {
            for (var i = 0; i < userData.length; i++) {
              userData[i]["password"] = "";
              if( userData[i]['user_feedback']==null){
                print('hello');
                userData[i]['user_feedback'] = "";
              }
              userData[i]['user_feedback'] = userData[i]['user_feedback']==null? userData[i]['user_feedback']:"";
              User user = User.fromJson(userData[i]);
              users.add(user);
            }
          }
          serverResponse.result = users;
        }
      } else {
        serverResponse =
            ServerResponse(ServerResponse.FAILED, response.toString());
      }
    }
    catch (e) {
      serverResponse = ServerResponse(ServerResponse.FAILED, e.toString());
    }
    return serverResponse;
  }

//=====================================================================================================================================

  Future<ServerResponse> updateUser(User user, String? authtoken) async {
    User updatedUser = User();
    ServerResponse serverResponse;
    String url = Constants.SERVER +
        PATH_UPDATE+
        "/" +
        "?authtoken=" +
        authtoken!;
    print(url);
    print(user.toJson());
    var body = json.encode(user.toJson());
    try {
      var response = await http.put(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        if (serverResponse.ifSuccess()) {
          updatedUser = User.fromJson(serverResponse.data);
        }
        serverResponse.result = updatedUser;
      } else {
        serverResponse =
            ServerResponse(ServerResponse.FAILED, response.toString());
      }
    }
    catch (e) {
      serverResponse = ServerResponse(ServerResponse.FAILED, e.toString());
    }
    return serverResponse;
  }
}