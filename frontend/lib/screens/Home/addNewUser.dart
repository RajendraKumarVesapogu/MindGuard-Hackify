import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/doctor-provider.dart';
import 'package:provider/provider.dart';

class AddNewMember extends StatelessWidget {
  const AddNewMember({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorProvider doctorProvider = Provider.of<DoctorProvider>(context);


    TextEditingController nameCont = TextEditingController();
    TextEditingController passwordCont = TextEditingController();
    TextEditingController phoneCont = TextEditingController();
    

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
            backgroundColor: Color.fromARGB(255, 174, 0, 95),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Center(
                            child: SizedBox(
                                // width: 500,
                                // height: 500,
                                ),
                          );
                        },
                        icon: Icon(
                          Icons.help_outline,
                          color: Colors.white,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.apps,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    
                  ],
                )
              ],
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Add new Patient",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 174, 0, 94)))
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 450,
                height: 700,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 246, 246),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('First name*',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 174, 0, 94),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(130, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Last name*',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 174, 0, 94),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 40,
                            child: TextField(
                              controller: nameCont,
                              decoration: InputDecoration(
                                labelText: "Your First name",
                                //hintText: "Enter your username",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                // prefixIcon: Icon(Icons.email_outlined)
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "Your surname",
                                      //hintText: "Enter your username",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      // prefixIcon: Icon(Icons.email_outlined)
                                    ),
                                  ),
                                ),
                              ])
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Phone Number*',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 174, 0, 94),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller:phoneCont,
                          decoration: InputDecoration(
                            // labelText: "group name",
                            hintText: "Enter patient phone Number",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      

                  
                      Padding(
                        padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('User Password*',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 174, 0, 94),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: 350,
                        height: 40,
                        child: TextField(
                          controller: passwordCont,
                          decoration: InputDecoration(
                            // labelText: "group name",
                            hintText: "Enter patient password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 10,
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          User user =  User();
                          user.doctor_id=3;
                          user.user_name = nameCont.text;
                          user.user_password = passwordCont.text;
                          user.user_feedback = "";
                          doctorProvider.addPatient(user);

                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 174, 0, 94),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),

              ),

           
            ]),
          ]),
        ),
      ),
    );
  }
}
