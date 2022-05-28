
import 'package:flutter/material.dart';
import 'auth/screens/login_screen.dart';
import 'config/colors.dart';
import 'screen/FirstScreen/first_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home:  LoginScreen()

      );
  }
}