
import 'package:ecommerce_app/Provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/product_provider.dart';
import 'auth/screens/login_screen.dart';
import 'config/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider())
    ],
    child:Builder(
          builder:(BuildContext context){
            return  MaterialApp(
                theme: ThemeData(
                    primaryColor: primaryColor,
                    scaffoldBackgroundColor: scaffoldBackgroundColor),
                debugShowCheckedModeBanner: false,
                home:  LoginScreen()

            );
          }
          )
    );

  }
}