import 'package:frontend/providers/doctor-provider.dart';
import 'package:frontend/providers/shared-preferences-provider.dart';
import 'package:frontend/screens/Auth/login.dart';
import 'package:frontend/screens/Home/group_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/providers/auth-provider.dart';
void main() {
  runApp(
      MultiProvider(
      providers: [
        Provider(create: (_) => AuthProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => DoctorProvider(context),lazy: false,),
  ],
  child: MaterialApp(
  title: 'MindGaurd',
  debugShowCheckedModeBanner: false,
  initialRoute: '/login',
  // home: Login(),
  theme: ThemeData(fontFamily: "Prompt",primarySwatch:Colors.purple),
  routes: {
    '/login': (context) => Login(),
    // '/patient-list': (context) => GroupList(),
  },
  ),
      ));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
