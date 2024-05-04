import 'package:frontend/models/history.dart';
import 'package:frontend/models/user.dart';
import 'package:flutter/material.dart';


class UserDetails extends StatefulWidget {
  final User? user;
  final dynamic? history;
  const UserDetails({super.key, required this.user, required this.history});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  bool showPassword = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 174, 0, 95),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },

        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text("Patient Details",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),

              ),
              const SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 4,
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'data:image/png;base64,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'),
                          )
                      ),

                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // buildTextField("E-mail",widget.user!.email, false),
              buildTextField("Name", (widget.user!.user_name).toString() , false),
              buildTextField("Phone", widget.user!.user_phone_number, false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "Kerala", false),
              Text(widget.history.toString()),
              Center(child: Text("data \ngoogle.com 2 hours \n youtube.com 3.2 hours" ,style: TextStyle(fontSize: 25),)),

              // buildTextField("clusterName", "Rajyam" , false),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 179, 0, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel", style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                    ),),


                  ),


                  ElevatedButton(


                    onPressed: () {
                      print(widget.history);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 179, 170, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Send Report", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),),
                  ),

                  ElevatedButton(


                    onPressed: () {
                      print(widget.history);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 41, 63, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Give Feedback", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),),
                  ),

                  ElevatedButton(


                    onPressed: () {
                      print(widget.history);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Save", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),),
                  )

                ],
              )


            ],
          ),
        ),
      ),
    );
  }


  Padding buildTextField(String labelText, String Placeholder,
      bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextField(
        enabled: false,
          obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: const Icon(Icons.remove_red_eye),
                color: Colors.black,
              ) : null,
              contentPadding: const EdgeInsets.only(bottom: 3),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,

              hintText: Placeholder,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              )
          )
      ),
    );
  }
}
//
// class MemberDetails extends StatelessWidget {
//   final User? user;
//   const MemberDetails({super.key, required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "MemberDetails UI",
//       home: EditMemberDetailsPage(),
//     );
//   }
// }
// class EditMemberDetailsPage extends StatefulWidget{
//   @override
//   _EditMemberDetailsPage createState() => _EditMemberDetailsPage();
//
// }
// class _EditMemberDetailsPage extends State<EditMemberDetailsPage>{
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.green
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 16, top:25, right:16),
//         child: GestureDetector(
//           onTap:(){
//             FocusScope.of(context).unfocus();
//           } ,
//           child: ListView(
//             children: [
//               const Text("Member Details",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold
//                 ),
//
//               ),
//               const SizedBox(height: 15),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor
//                           ),
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage( 'https://cache.careers360.mobi/media/article_images/2020/5/12/amrita-university_650x400_51486629184.jpg'),
//                           )
//                       ),
//
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height:40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor
//                           ),
//                           color: Colors.green,
//                         ),
//                         child: const Icon(
//                           Icons.edit,
//                           color: Colors.white,
//
//                         ),
//                       ),)
//
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               buildTextField(widget.user!.,false),
//               buildTextField("E-mail", "shinoyyandra@gmail.com",false),
//               buildTextField("Password", "********",true),
//               buildTextField("Location", "Kerala",false),
//               const SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text("Cancel", style: TextStyle(
//                       fontSize: 14,
//                       letterSpacing: 2.2,
//                     ),),
//
//
//                   ),
//                   ElevatedButton(
//
//
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.green,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text("Save", style: TextStyle(
//                         fontSize: 14,
//                         letterSpacing: 2.2,
//                         color: Colors.white),),
//                   )
//
//                 ],
//               )
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Padding buildTextField(String labelText, String Placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom:30.0),
//       child: TextField(
//           obscureText: isPasswordTextField ? showPassword : false,
//           decoration: InputDecoration(
//               suffixIcon: isPasswordTextField ? IconButton(
//                 onPressed: () {
//                   setState(() {
//                     showPassword = !showPassword;
//                   });
//                 },
//                 icon: const Icon(Icons.remove_red_eye),
//                 color: Colors.grey,
//               ) : null,
//               contentPadding: const EdgeInsets.only(bottom: 3),
//               labelText: labelText,
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//
//               hintText: Placeholder,
//               hintStyle: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[400]
//               )
//           )
//       ),
//     );
//   }
// }