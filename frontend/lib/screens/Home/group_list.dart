import 'dart:convert';
import 'dart:math';
import 'package:frontend/models/history.dart';
import 'package:frontend/models/serverResponse.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/doctor-provider.dart';
import 'package:frontend/screens/Home/addNewUser.dart';
import 'package:frontend/screens/Home/member_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/doctor.dart';
import '../../models/user.dart';
import 'package:http/http.dart' as http;
import '../../models/history.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListsState();
}

class _DoctorListsState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    DoctorProvider doctorProvider = Provider.of<DoctorProvider>(context);
    List<User> userList = doctorProvider.getUsers(context);
    print(userList.length);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
              backgroundColor: Color.fromARGB(255, 174, 0, 95),
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset("logo.jpg"),
                  Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            Center(
                              child: SizedBox(),
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
                      Text(
                        "Dr. Rajendra",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNewMember(),
                    fullscreenDialog: true));
          },
          child: Text("Create a new Patient",
              style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 174, 0, 95),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            shadowColor: Colors.grey,
            alignment: Alignment.center,
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Doctor Dashboard",style: TextStyle(fontSize: 30),),
                            SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 800,
                child: TextField(
                    decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 174, 0, 95),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 174, 0, 95),
                    ),
                  ),
                )),
              ),

              SizedBox(height: 10,),
              
              Container(
                child: Expanded(
                    child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8),
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    User? user = userList[index];

                    return GestureDetector(
                      onTap: () async {
                        dynamic ? history ;
                        ServerResponse serverResponse;
                        try {
                          var url = "http://localhost:5000/history/?userId=" +
                              user.user_id.toString();
                          var response = await http.get(Uri.parse(url),
                              headers: {"Content-Type": "application/json"});
                          if (response.statusCode == 200) {
                            serverResponse = ServerResponse.fromJson(
                                json.decode(response.body));
                            if (serverResponse.ifSuccess()) {
                              history = serverResponse.data;
                            }
                          } else {
                            serverResponse = ServerResponse(
                                ServerResponse.FAILED, response.toString());
                          }
                        } catch (e) {
                          ServerResponse serverResponse = ServerResponse(
                              ServerResponse.FAILED, e.toString());
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDetails(user: user, history: history)));
                        // Update
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AddNewNotePage(isUpdate: true, note: currentNote,)
                        //   ),
                        // );
                      },
                      onLongPress: () {
                        // Delete
                        // notesProvider.deleteNote(currentNote);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.user_name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              user.user_phone_number,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Kerala",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Score : 90",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
              )
            ],
          ),
        ));
  }
}
