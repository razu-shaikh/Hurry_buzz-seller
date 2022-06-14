import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/auth_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{

  Auth? authData ;
   String? _token;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
   Future<void> logIn(String email, String password) async{
    print(email+password);
       setLoading(true);
    try {
      Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/login',
        options: Options(
            headers: {
              "apiKey": "sdfdge544364dg#"},),
        data: {
          "email": email,
          "password": password
        },
      );
      Map<String,dynamic> authDataList= response.data;
      print(response.statusCode);

      if(response.statusCode == 200){
        // _dashboardData.clear();
        authData = Auth.fromJson(authDataList);
        print(authData!.toJson());
         _token = authData!.data!.token;
        print(_token);

        setLoading(false);
      }
    } catch (e) {
      print(e.toString);
      setLoading(false);
    }
   }
   String? get token {
     return _token;
   }


}