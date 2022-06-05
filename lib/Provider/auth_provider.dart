import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier{
   var token ;
   var email_user ;
   var firstName ;
   var fullName ;

  bool _loading = false;
  bool get loading => _loading;
  bool _logInSuccess = false;
  bool get logInsuccess => _logInSuccess;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  setLogIn(bool value){
    _logInSuccess = value;
    notifyListeners();
  }
   void logIn(String email, String password) async{
    print(email+password);
       setLoading(true);
     try{
       Response response = await post(Uri.parse("https://hurrybuzz.com/api/v1/seller/login"),
         headers: {"apiKey": "sdfdge544364dg#"},
         body: {
           "email": email,
           "password": password
         },
       );
       if(response.statusCode == 200){
         var data = jsonDecode(response.body);
         token = data['data']['token'];
         email_user = data['data']['user']['email'];
         print(email_user);
         // token = data['data']['token']['title'];
         // token = data['data']['token']['title'];
         setLogIn(true);
         setLoading(false);

       }else{
         print("Fail");
         setLoading(false);
       }
     }
     catch(e){
       print(e.toString);
       setLoading(false);

     }


   }

}