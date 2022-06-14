
import 'package:ecommerce_app/Provider/auth_provider.dart';
import 'package:ecommerce_app/Provider/dashboard_provider.dart';
import 'package:ecommerce_app/Provider/shop_provider.dart';
import 'package:ecommerce_app/Provider/signIn_provider.dart';
import 'package:ecommerce_app/Provider/order_provider.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/order_provider.dart';
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
  String? tokenValue;

  @override
  void initState() {
    super.initState();
    getToken();
  }
  void getToken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    tokenValue = pref.getString("token");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    print("main"+tokenValue.toString());
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => SignInProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ChangeNotifierProvider(create: (_) => ShopProvider()),
      // ChangeNotifierProxyProvider<AuthProvider, DashboardProvider>(
      //   create: (context) => DashboardProvider(),
      //   update:(context,auth,authToken)=> authToken!..update(auth.token!)),
      // ChangeNotifierProxyProvider<AuthProvider, ShopProvider>(
      //     create: (context) => ShopProvider(),
      //     update:(context,auth,authToken)=> authToken!..update(auth.token!)),
      // ChangeNotifierProxyProvider<AuthProvider, OrderProvider>(
      //     create: (context) => OrderProvider(),
      //     update:(context,auth,authToken)=> authToken!..update(auth.token!)),

    ],
      child:Builder(
          builder:(BuildContext context){
            return  MaterialApp(
                theme: ThemeData(
                    primaryColor: primaryColor,
                    scaffoldBackgroundColor: scaffoldBackgroundColor),
                debugShowCheckedModeBanner: false,
                // home:  MyNavigationBar()
                home:tokenValue == null? LoginScreen():MyNavigationBar()

            );
          }
          )
    );

  }

}