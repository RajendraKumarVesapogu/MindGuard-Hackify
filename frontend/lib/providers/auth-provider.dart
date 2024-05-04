import 'package:frontend/models/doctor.dart';
import 'package:frontend/models/serverResponse.dart';
import 'package:frontend/services/auth-service.dart';
class AuthProvider{
  final authService = new AuthService();
  Doctor loggedInDoctor = Doctor();
  String loggedPassword = "";
  String futureLoginDoctorName = "";
  String futureLoginPassword = "";
  String authToken = "";

  Map<String, dynamic> loginHandlers = {};
  Map<String, dynamic> logoutHandlers = {};

  update(DoctorProvider) {
    if (loggedInDoctor != null &&
        loggedInDoctor.doctor_phone_number != null &&
        loggedPassword != null) {
      login(loggedInDoctor.doctor_phone_number, loggedPassword);
    } else {
      print('Expired Auth is occuring without prior login..should never have occured');
    }
  }

  addLoginHandler(String key, dynamic function) {
    loginHandlers[key] = function;
  }

  addLogoutHandler(String key, dynamic function) {
    logoutHandlers[key] = function;
  }

  callLoginHandlers() {
    for (dynamic handler in loginHandlers.values) {
      if (handler != null) {
        handler();
      }
    }
  }

  callLogoutHandlers() {
    for (dynamic handler in logoutHandlers.values) {
      if (handler != null) {
        handler();
      }
    }
  }

  login(doctor_phone_number, password, {loggedInEarlier = false}) async {
    if (true) {
      ServerResponse serverResponse =
      await authService.login(doctor_phone_number, password);
      print(serverResponse.status);
      if (serverResponse.ifSuccess()) {
        authToken = serverResponse.authToken;
        print(authToken);
        loggedInDoctor = Doctor.fromJson(serverResponse.data);

        // http://localhost:3456/cluster?authToken=aed8bacb4804ac1678d2eba3fa6597a2f0096148
        loggedPassword = password;
        print(loggedInDoctor);
        callLoginHandlers();
      }
      return serverResponse;
    }
  }

  logout() {
    print('****LogOut is called');
    callLogoutHandlers();
    loggedInDoctor = Doctor();
    authToken = "";
    loggedPassword = "";
  }

 
}
