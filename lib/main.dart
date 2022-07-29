import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/screens/login_screen.dart';
import 'config/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
           debugShowCheckedModeBanner: false,
        home: RouteNavigationScreen(),
       //home:LoginScreen()
    );
  }
}

class RouteNavigationScreen extends StatefulWidget {
  const RouteNavigationScreen({Key? key}) : super(key: key);

  @override
  State<RouteNavigationScreen> createState() => _RouteNavigationScreenState();
}

class _RouteNavigationScreenState extends State<RouteNavigationScreen> {

  bool? initialRoute;

  Future<void> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.reload();
    String? token = pref.getString("token");

    if(token != null) {
      try {
        Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/me',
          options: Options(
              headers: {
                "apiKey": "sdfdge544364dg#",
                "Authorization": "Bearer $token"}),
        );
        if(response.statusCode == 200) {
          initialRoute = true;
        } else {
          initialRoute = false;
        }
      } catch(e) {
        initialRoute = false;
      }
    } else {
      initialRoute = false;
    }
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    if(initialRoute == true) {
      return MyNavigationBar();
    }
    if(initialRoute == false) {
      return LoginScreen();
    }
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.blue,),),
    );
  }
}

