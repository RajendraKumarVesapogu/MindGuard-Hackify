
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/providers/auth-provider.dart';
import 'package:frontend/providers/doctor-provider.dart';
import 'package:frontend/providers/shared-preferences-provider.dart';
import 'package:frontend/screens/Home/group_list.dart';
import 'package:provider/provider.dart';
import 'package:frontend/models/serverResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/models/user.dart';
import 'dart:convert';

import '../../common/dialogUtil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 30,),
            SizedBox(height: 100,),
            Center(
              child: Container(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0,10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text("Login", style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 174, 0, 94),
                    ),),
                    SizedBox(height: 10),
                    Text("Use your admin phone number"),
                    SizedBox(height: 60,),
                    Container(
                      width: 350,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 350,
                      child: TextField(
                        controller: pinController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.remove_red_eye)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text("Forgot password ?", style: TextStyle(color: Color.fromARGB(255, 152, 5, 54)),)
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                        onTap: () async {
                          var authProvider = Provider.of<AuthProvider>(context, listen: false);
                          setState(() {
                          isLoading = true;

                          });
                          ServerResponse res = await authProvider.login(phoneController.text, pinController.text);
                          if(res.ifSuccess()) {
                            DoctorProvider clusterProvider = Provider.of<DoctorProvider>(context, listen: false);
                            await clusterProvider.helper(context);
                            print("hello");
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorList()));
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: DoctorList()));

                          }
                          else {
                            // show dialog box with error message
                            setState(() {
                              isLoading = false;

                            });
                            DialogUtils.showCustomDialog(context);



                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 174, 0, 94),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: isLoading?CircularProgressIndicator():Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
                          ),
                        ),
                     ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}