import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    bool showPassword = false;
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back,
                color: Colors.green
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },

          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, top:25, right:16),
          child: GestureDetector(
            onTap:(){
              FocusScope.of(context).unfocus();
            } ,
            child: ListView(
              children: [
                const Text("Edit Profile",
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
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage( 'https://cache.careers360.mobi/media/article_images/2020/5/12/amrita-university_650x400_51486629184.jpg'),
                            )
                        ),

                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height:40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor
                            ),
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,

                          ),
                        ),)

                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                buildTextField("Full Name", "Rajendra Kumar",false),
                buildTextField("E-mail", "rajendrakumar@gmail.com",false),
                buildTextField("Password", "********",true),
                buildTextField("Location", "Kerala",false),
                buildTextField("ClusterName", "Rajyam",false),
                buildTextField("Total Groups", "9",false),
                buildTextField("Total Amount", "120000",false),
                buildTextField("Current Active Loans", "3",false),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
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


                      onPressed: () {},
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

    Padding buildTextField(String labelText, String Placeholder, bool isPasswordTextField) {
      return Padding(
        padding: const EdgeInsets.only(bottom:30.0),
        child: TextField(
            obscureText: isPasswordTextField ? showPassword : false,
            decoration: InputDecoration(
                suffixIcon: isPasswordTextField ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                ) : null,
                contentPadding: const EdgeInsets.only(bottom: 3),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,

                hintText: Placeholder,
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]
                )
            )
        ),
      );
    }

}