import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      ) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Login Failed"),
            // content: /* Here add your custom widget  */,
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 174, 0, 94),),
                  padding: MaterialStateProperty.all(EdgeInsets.all(7)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),

                child: Text("Ok"),
                onPressed:()=> Navigator.pop(context),
              ),

            ],
          );
        });
  }
}