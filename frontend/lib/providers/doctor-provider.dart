
import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/models/doctor.dart';
import 'package:frontend/models/serverResponse.dart';
import 'package:frontend/providers/auth-provider.dart';
import 'package:frontend/services/auth-service.dart';
import 'package:frontend/services/doctor-service.dart';
import 'package:provider/provider.dart';

class DoctorProvider with ChangeNotifier {
  List<User> _users = [];

  DoctorService _doctorService = DoctorService();

  DoctorProvider(BuildContext context) {
    // helper(context);
  }
  Future<void> helper(BuildContext context) async{
    await fetchUsers(context);
    notifyListeners();
  }

  Future<void> fetchUsers(BuildContext context)async{
    AuthProvider authService = Provider.of<AuthProvider>(context, listen: false);
    ServerResponse serverResponse = await _doctorService.getAllUsers(authService.authToken);
    if (serverResponse.status == ServerResponse.SUCCESS) {
      _users = serverResponse.result;

      notifyListeners();
    }
  }
  
  void addPatient(User user){
    _users.add(user);
    notifyListeners();
  }
  List<User> getUsers(BuildContext context)  {
    return _users;
  }
}
