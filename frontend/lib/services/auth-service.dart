import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/models/serverResponse.dart';
import 'package:frontend/models/doctor.dart';
import 'package:frontend/common/constants.dart';
import 'package:crypto/crypto.dart';


class AuthService {
  static const String PATH_LOGIN = "/doctor/login";
  int serverTime = 0;
  int clientTimeWhenServerTime = 0;

  setServerTime(serverTime) {
    this.serverTime = serverTime;
    this.clientTimeWhenServerTime = DateTime.now().millisecondsSinceEpoch;
  }

  getServerTime(inputTime) {
    return inputTime - (this.clientTimeWhenServerTime - this.serverTime);
  }

  Future<ServerResponse> login(String phoneNumber, String password) async {
    ServerResponse serverResponse;
    String passHash = password;

    String url = Constants.SERVER + PATH_LOGIN;
    print(Uri.parse(url));
    Map data = {'phone_number': phoneNumber, 'password': passHash};

    var body = json.encode(data);
    print(body);
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      print(response.statusCode);
      print(response);
      if (response.statusCode == 200) {
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
        setServerTime(serverResponse.serverTime);
      } else {
        print("else condition in auth_service");
        serverResponse = ServerResponse.fromJson(json.decode(response.body));
      }
    }
    catch (error) {
      serverResponse =
          ServerResponse(ServerResponse.FAILED, "Unable to connect to server.");
    }
    return serverResponse;
  }
}