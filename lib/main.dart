import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/screens/login_screen.dart';
import 'config/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  Future<void> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.reload();
    token = pref.getString("token");
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
    //print("token"+token.toString());
    // return MultiProvider(providers: [
    //   ChangeNotifierProvider(create: (_) => SignInProvider()),
    //   ChangeNotifierProvider(create: (_) => OrderProvider()),
    //   ChangeNotifierProvider(create: (_) => ShopProvider()),
    //   ChangeNotifierProvider(create: (_) => ProfileProvider()),
    //   ChangeNotifierProxyProvider<AuthProvider, ShopProvider>(
    //       create: (context) => ShopProvider(),
    //       update:(context,auth,authToken)=> authToken!..update(auth.token!)),
    //   ChangeNotifierProxyProvider<AuthProvider, OrderProvider>(
    //       create: (context) => OrderProvider(),
    //       update:(context,auth,authToken)=> authToken!..update(auth.token!)),
    //   ChangeNotifierProxyProvider<AuthProvider, ProfileProvider>(
    //       create: (context) => ProfileProvider(),
    //       update:(context,auth,authToken)=> authToken!..update(auth.token!)),
    //
    // ],
    return MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
           debugShowCheckedModeBanner: false,
        home: token == null ? LoginScreen() : MyNavigationBar()
       //home:LoginScreen()
    );
  }
}
